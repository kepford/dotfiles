#!/usr/bin/env bash

# --- Configuration ---
SCREEN_RES="1920x1080" # **CRITICAL: Set your resolution**
OUTPUT_DIR="$HOME/Videos/Screencasts"
PID_FILE="/tmp/screencast.pid"
TEMP_FILE="/tmp/screencast.mkv"

# FFmpeg settings
VIDEO_CRF="23"
VIDEO_PRESET="veryfast"
FRAMERATE="30"
AUDIO_INPUT="default" 

# --- Argument Parsing ---
MODE="background" # Default mode for i3 keybinds
RECORD_AUDIO=true  # Default is to record audio

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

# --- STOP RECORDING (Background Mode) ---
if [ "$MODE" == "background" ] && [ -f "$PID_FILE" ] && [ -n "$(cat "$PID_FILE")" ]; then
    PID=$(cat "$PID_FILE")
    
    # Send SIGINT (Ctrl+C equivalent) for a graceful stop
    kill -INT "$PID" 
    
    sleep 2
    rm -f "$PID_FILE"
    
    FINAL_FILE="$OUTPUT_DIR/screencast-$(date +'%Y-%m-%d_%H%M%S').mkv"
    
    if [ -f "$TEMP_FILE" ]; then
        mv "$TEMP_FILE" "$FINAL_FILE"
        notify-send "🎥 Screencast Stopped" "Recording saved to ${FINAL_FILE##*/}"
    else
        notify-send "⚠️ Screencast Error" "Temporary file was not found."
    fi
    exit 0
fi

# --- START RECORDING ---
rm -f "$TEMP_FILE"

# The core FFmpeg command
# Includes all video args and the dynamically generated audio args
FFMPEG_CMD="ffmpeg -y \
    -video_size \"$SCREEN_RES\" -framerate \"$FRAMERATE\" -f x11grab -i :0.0 \
    $AUDIO_ARGS \
    -c:v libx264 -preset \"$VIDEO_PRESET\" -crf \"$VIDEO_CRF\" \
    -pix_fmt yuv420p \
    \"$TEMP_FILE\""

if [ "$MODE" == "foreground" ]; then
    notify-send "🔴 Screencast Started" "Recording in foreground. Press 'q' or Ctrl+C to stop."
    
    # Run in the foreground, letting the shell handle Ctrl+C/q
    eval $FFMPEG_CMD
    
    FINAL_FILE="$OUTPUT_DIR/screencast-$(date +'%Y-%m-%d_%H%M%S').mkv"
    if [ -f "$TEMP_FILE" ]; then
        mv "$TEMP_FILE" "$FINAL_FILE"
        notify-send "🎥 Screencast Stopped" "Recording saved to ${FINAL_FILE##*/}"
    fi

elif [ "$MODE" == "background" ]; then
    # Run in the background for i3 keybinding, tracking PID
    eval $FFMPEG_CMD &
    
    # Store the PID of the last background process ($!)
    echo $! > "$PID_FILE"
    notify-send "🔴 Screencast Started" "Recording in background (i3 mode)..."
fi
