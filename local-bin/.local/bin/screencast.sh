#!/usr/bin/env bash

# --- Configuration ---
SCREEN_RES="1920x1080" # Set the resolution you are using for the current session
OUTPUT_DIR="$HOME/Videos/Screencasts"
TEMP_FILE="/tmp/screencast.mkv"
FFMPEG_MARKER="i3_screencast_$(date +%Y%m%d)" # Unique marker for pgrep

# FFmpeg settings
VIDEO_CRF="23"
VIDEO_PRESET="veryfast"
FRAMERATE="30"
AUDIO_INPUT="default" 

# --- Argument Parsing ---
MODE="background"
RECORD_AUDIO=true

for arg in "$@"; do
    case "$arg" in
        -f|--foreground)
            MODE="foreground"
            ;;
        -n|--no-audio)
            RECORD_AUDIO=false
            ;;
    esac
done

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# --- Define Audio Input/Codec String ---
AUDIO_ARGS=""
if [ "$RECORD_AUDIO" = true ]; then
    AUDIO_ARGS="-f pulse -ac 2 -i \"$AUDIO_INPUT\" -c:a aac -b:a 128k"
fi

# ----------------------------------------
# --- STOP RECORDING LOGIC (Marker Search) ---
# ----------------------------------------

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
    
    # 4. Move and notify
    if [ -f "$TEMP_FILE" ]; then
        mv "$TEMP_FILE" "$FINAL_FILE"
        notify-send "🎥 Screencast Stopped" "Recording saved to ${FINAL_FILE##*/}"
    else
        notify-send "⚠️ Screencast Error" "Temporary file was not found."
    fi
    exit 0
fi

# ----------------------------------------
# --- START RECORDING LOGIC ---
# ----------------------------------------

# If the script reaches here, no running process with the marker was found, so we start.
rm -f "$TEMP_FILE"

# The core FFmpeg command assembled, including the unique metadata marker
FFMPEG_CMD="ffmpeg -y \
    -video_size \"$SCREEN_RES\" -framerate \"$FRAMERATE\" -f x11grab -i :0.0 \
    $AUDIO_ARGS \
    -c:v libx264 -preset \"$VIDEO_PRESET\" -crf \"$VIDEO_CRF\" \
    -pix_fmt yuv420p \
    -metadata title=$FFMPEG_MARKER \
    \"$TEMP_FILE\""

if [ "$MODE" == "foreground" ]; then
    notify-send "🔴 Screencast Started" "Recording in foreground. Press 'q' or Ctrl+C to stop."
    
    eval $FFMPEG_CMD
    
    FINAL_FILE="$OUTPUT_DIR/screencast-$(date +'%Y-%m-%d_%H%M%S').mkv"
    if [ -f "$TEMP_FILE" ]; then
        mv "$TEMP_FILE" "$FINAL_FILE"
        notify-send "🎥 Screencast Stopped" "Recording saved to ${FINAL_FILE##*/}"
    fi

elif [ "$MODE" == "background" ]; then
    # Background Mode: Starts FFmpeg with the unique marker
    eval $FFMPEG_CMD &
    
    notify-send "🔴 Screencast Started" "Recording in background (i3 mode)..."
fi
