#!/bin/bash

# Check for 'brave' first
if command -v brave &>/dev/null; then
    exec brave
# If not found, check for 'brave-browser'
elif command -v brave-browser &>/dev/null; then
    exec brave-browser
else
    # Optional: Display an error if neither is found
    # You might need 'notify-send' or 'zenity' for this
    notify-send "Brave Browser Error" "Brave executable not found! (Tried 'brave' and 'brave-browser')"
    exit 1
fi
