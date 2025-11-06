#!/usr/bin/env bash

# ==============================================================================
# SCREENCAST.SH - Multi-Monitor Screen Recording Script
# ==============================================================================
#
# DESCRIPTION:
#   Records your screen using ffmpeg with support for multi-monitor setups.
#   Automatically detects available monitors and allows selection via interactive
#   menu or command-line argument. Works in both foreground (CLI) and background
#   (i3 keybind) modes.
#
# FEATURES:
#   - Auto-detects all connected monitors via xrandr
#   - Interactive monitor selection (rofi/dmenu/fzf/bash select)
#   - Single monitor auto-selection (no prompt)
#   - Command-line monitor specification
#   - Foreground mode (default) - Press 'q' to stop
#   - Background mode (toggle) - Run script again to stop
#   - Audio recording (optional)
#   - High-quality H.264 encoding
#
# ==============================================================================
# USAGE
# ==============================================================================
#
# FLAGS:
#   -b, --background       Run in background mode (for i3 keybinds)
#   -n, --no-audio         Record without audio
#   -m, --monitor NAME     Specify monitor (e.g., HDMI-1, DP-1, eDP-1)
#
# ==============================================================================
# EXAMPLES
# ==============================================================================
#
# BASIC USAGE (CLI - Foreground Mode):
#   ./screencast.sh                    # Start recording, press 'q' to stop
#   ./screencast.sh -n                 # Record without audio
#   ./screencast.sh -m HDMI-1          # Record specific monitor
#
# BACKGROUND MODE (i3 Keybind Usage):
#   ./screencast.sh -b                 # Start in background
#   ./screencast.sh -b                 # Run again to STOP (toggle)
#   ./screencast.sh -b -n              # Background mode without audio
#
# MULTI-MONITOR EXAMPLES:
#   ./screencast.sh                    # Shows menu to select monitor
#   ./screencast.sh -m DP-1            # Skip menu, record DP-1
#   ./screencast.sh -m HDMI-1 -n       # Record HDMI-1 without audio
#
# COMBINED FLAGS:
#   ./screencast.sh -b -m eDP-1 -n     # Background, specific monitor, no audio
#
# ==============================================================================
# HOW TO STOP RECORDING
# ==============================================================================
#
# FOREGROUND MODE (default):
#   - Press 'q' in the terminal
#   - Or press Ctrl+C
#
# BACKGROUND MODE (-b flag):
#   - Run the script again with the same flags
#   - The script acts as a toggle (start/stop)
#   - From i3 keybind: Press the same keybind again
#
# ==============================================================================
# OUTPUT
# ==============================================================================
#
# Videos are saved to: ~/Videos/Screencasts/
# Filename format: screencast-YYYY-MM-DD_HHMMSS.mkv
#
# ==============================================================================
# I3 KEYBIND EXAMPLE
# ==============================================================================
#
# Add to your i3 config:
#   bindsym $mod+Shift+s exec --no-startup-id ~/.local/bin/screencast.sh -b -n
#
# First press: Starts recording (shows monitor selection if multiple monitors)
# Second press: Stops recording and saves file
#
# ==============================================================================


# --- Configuration ---
OUTPUT_DIR="$HOME/Videos/Screencasts"
TEMP_FILE="/tmp/screencast.mkv"
MONITOR_INFO_FILE="/tmp/screencast_monitor.info"
FFMPEG_MARKER="i3_screencast_$(date +%Y%m%d)" # Unique marker for pgrep

# FFmpeg settings
VIDEO_CRF="23"
VIDEO_PRESET="veryfast"
FRAMERATE="30"
AUDIO_INPUT="default" 

# --- Argument Parsing ---
MODE="foreground"
RECORD_AUDIO=true
SELECTED_MONITOR=""
MONITOR_ARG_NEXT=false

for arg in "$@"; do
    case "$arg" in
        -b|--background)
            MODE="background"
            ;;
        -n|--no-audio)
            RECORD_AUDIO=false
            ;;
        -m|--monitor)
            MONITOR_ARG_NEXT=true
            ;;
        *)
            if [ "$MONITOR_ARG_NEXT" = true ]; then
                SELECTED_MONITOR="$arg"
                MONITOR_ARG_NEXT=false
            fi
            ;;
    esac
done

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# ----------------------------------------
# --- STOP RECORDING LOGIC (Marker Search) ---
# ----------------------------------------
# Check if a recording is already running BEFORE doing monitor selection

# Search for the running FFmpeg PID using the unique FFMPEG_MARKER in the command line
# This is the most reliable method when args and PID files fail.
PID=$(pgrep -f "ffmpeg.*-metadata title=$FFMPEG_MARKER")

if [ -n "$PID" ]; then
    echo "Stopping FFmpeg PID: $PID via marker search" >> /tmp/screencast.log
    
    # 1. Send SIGINT (Ctrl+C equivalent) for a graceful stop
    kill -INT "$PID" 
    
    # 2. Give FFmpeg time to finalize.
    sleep 3 

    # 3. Double-check: If it's STILL running, kill it forcefully.
    if ps -p "$PID" > /dev/null; then
        echo "FFmpeg failed graceful stop. Forcing SIGKILL." >> /tmp/screencast.log
        kill -KILL "$PID"
    fi

    FINAL_FILE="$OUTPUT_DIR/screencast-$(date +'%Y-%m-%d_%H%M%S').mkv"

    # 4. Read monitor info if available
    RECORDED_MONITOR="Unknown"
    if [ -f "$MONITOR_INFO_FILE" ]; then
        RECORDED_MONITOR=$(cat "$MONITOR_INFO_FILE")
        rm -f "$MONITOR_INFO_FILE"
    fi

    # 5. Move and notify
    if [ -f "$TEMP_FILE" ]; then
        mv "$TEMP_FILE" "$FINAL_FILE"
        notify-send "🎥 Screencast Stopped" "Recording of $RECORDED_MONITOR saved to ${FINAL_FILE##*/}"
    else
        notify-send "⚠️ Screencast Error" "Temporary file was not found."
    fi
    exit 0
fi

# ----------------------------------------
# --- MONITOR DETECTION AND SELECTION ---
# ----------------------------------------
# Only reached if we're starting a new recording (not stopping)

# Parse available monitors from xrandr
declare -a AVAILABLE_MONITORS
declare -A MONITOR_DATA

while read -r name width height xoff yoff; do
    AVAILABLE_MONITORS+=("$name: ${width}x${height}")
    MONITOR_DATA["${name}_width"]=$width
    MONITOR_DATA["${name}_height"]=$height
    MONITOR_DATA["${name}_xoff"]=$xoff
    MONITOR_DATA["${name}_yoff"]=$yoff
done < <(xrandr | grep -w connected | \
         sed -r "s/^([^ ]*).*\b([-0-9]+)x([-0-9]+)\+([-0-9]+)\+([-0-9]+).*$/\1 \2 \3 \4 \5/")

# Determine which monitor to use
MONITOR_CHOICE=""

if [ -n "$SELECTED_MONITOR" ]; then
    # Command-line argument provided - find matching monitor
    for monitor in "${AVAILABLE_MONITORS[@]}"; do
        if [[ "$monitor" == "$SELECTED_MONITOR"* ]]; then
            MONITOR_CHOICE="$monitor"
            break
        fi
    done

    # If exact match not found, try case-insensitive
    if [ -z "$MONITOR_CHOICE" ]; then
        for monitor in "${AVAILABLE_MONITORS[@]}"; do
            if [[ "${monitor,,}" == "${SELECTED_MONITOR,,}"* ]]; then
                MONITOR_CHOICE="$monitor"
                break
            fi
        done
    fi

    # If still not found, error out
    if [ -z "$MONITOR_CHOICE" ]; then
        notify-send "⚠️ Screencast Error" "Monitor '$SELECTED_MONITOR' not found"
        exit 1
    fi
elif [ ${#AVAILABLE_MONITORS[@]} -eq 1 ]; then
    # Only one monitor, use it automatically
    MONITOR_CHOICE="${AVAILABLE_MONITORS[0]}"
else
    # Multiple monitors available - show interactive selection
    if command -v rofi &> /dev/null; then
        MONITOR_CHOICE=$(printf '%s\n' "${AVAILABLE_MONITORS[@]}" | rofi -dmenu -p "Select monitor:" -i)
    elif command -v dmenu &> /dev/null; then
        MONITOR_CHOICE=$(printf '%s\n' "${AVAILABLE_MONITORS[@]}" | dmenu -p "Select monitor:")
    elif command -v fzf &> /dev/null; then
        MONITOR_CHOICE=$(printf '%s\n' "${AVAILABLE_MONITORS[@]}" | fzf --prompt="Select monitor: " --height=40%)
    else
        # Fallback to bash select
        echo "Select a monitor:" >&2
        select MONITOR_CHOICE in "${AVAILABLE_MONITORS[@]}"; do
            [ -n "$MONITOR_CHOICE" ] && break
        done
    fi

    # If user cancelled selection, exit
    if [ -z "$MONITOR_CHOICE" ]; then
        notify-send "⚠️ Screencast Cancelled" "No monitor selected"
        exit 0
    fi
fi

# Extract monitor name from choice (format: "NAME: WIDTHxHEIGHT")
MONITOR_NAME="${MONITOR_CHOICE%%:*}"

# Get monitor parameters
SCREEN_WIDTH="${MONITOR_DATA["${MONITOR_NAME}_width"]}"
SCREEN_HEIGHT="${MONITOR_DATA["${MONITOR_NAME}_height"]}"
SCREEN_XOFF="${MONITOR_DATA["${MONITOR_NAME}_xoff"]}"
SCREEN_YOFF="${MONITOR_DATA["${MONITOR_NAME}_yoff"]}"

# Update SCREEN_RES and calculate offset for ffmpeg
SCREEN_RES="${SCREEN_WIDTH}x${SCREEN_HEIGHT}"
SCREEN_OFFSET="+${SCREEN_XOFF},${SCREEN_YOFF}"

# --- Define Audio Input/Codec String ---
AUDIO_ARGS=""
if [ "$RECORD_AUDIO" = true ]; then
    AUDIO_ARGS="-f pulse -ac 2 -i \"$AUDIO_INPUT\" -c:a aac -b:a 128k"
fi

# ----------------------------------------
# --- START RECORDING LOGIC ---
# ----------------------------------------

# If the script reaches here, no running process with the marker was found, so we start.
rm -f "$TEMP_FILE"

# Store monitor info for later retrieval when stopping
echo "$MONITOR_NAME ($SCREEN_RES)" > "$MONITOR_INFO_FILE"

# The core FFmpeg command assembled, including the unique metadata marker
FFMPEG_CMD="ffmpeg -y \
    -video_size \"$SCREEN_RES\" -framerate \"$FRAMERATE\" -f x11grab -i :0.0${SCREEN_OFFSET} \
    $AUDIO_ARGS \
    -c:v libx264 -preset \"$VIDEO_PRESET\" -crf \"$VIDEO_CRF\" \
    -pix_fmt yuv420p \
    -metadata title=$FFMPEG_MARKER \
    \"$TEMP_FILE\""

if [ "$MODE" == "foreground" ]; then
    notify-send "🔴 Screencast Started" "Recording $MONITOR_NAME ($SCREEN_RES) in foreground. Press 'q' or Ctrl+C to stop."
    
    eval $FFMPEG_CMD
    
    FINAL_FILE="$OUTPUT_DIR/screencast-$(date +'%Y-%m-%d_%H%M%S').mkv"
    if [ -f "$TEMP_FILE" ]; then
        mv "$TEMP_FILE" "$FINAL_FILE"
        notify-send "🎥 Screencast Stopped" "Recording saved to ${FINAL_FILE##*/}"
    fi

elif [ "$MODE" == "background" ]; then
    # Background Mode: Starts FFmpeg with the unique marker
    eval $FFMPEG_CMD &

    notify-send "🔴 Screencast Started" "Recording $MONITOR_NAME ($SCREEN_RES) in background. Run script again to stop."
fi
