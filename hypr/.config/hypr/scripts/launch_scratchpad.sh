#!/bin/bash

app_class="$1"
shift
app_cmd="$@"

scratchpad_name="scratchpad-$app_class"

# Check if scratchpad window already exists
if hyprctl clients | grep -q "class: $scratchpad_name"; then
    # Toggle the scratchpad
    hyprctl dispatch togglespecialworkspace scratch
else
    # Launch the app
    kitty --class "$scratchpad_name" -e $app_cmd &

    # Wait for window to appear
    sleep 0.3

    # Move to special workspace
    hyprctl dispatch movetoworkspacesilent special:scratch,$scratchpad_name
    hyprctl dispatch togglespecialworkspace scratch
fi
