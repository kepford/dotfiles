#!/bin/bash

app_class="$1"
shift
app_cmd="$@"

# Toggle if already visible
if i3-msg '[class="'"$app_class"'"] scratchpad show' | grep -q true; then
    exit 0
fi

# Launch the app in background
kitty --class "$app_class" -e $app_cmd &

# Wait for the window to be mapped
for i in {1..20}; do
    sleep 0.1
    if xdotool search --class "$app_class" > /dev/null; then
        break
    fi
done

# Final delay to ensure geometry is ready
sleep 0.2

# Float, resize, and center
i3-msg '[class="'"$app_class"'"] move to scratchpad, floating enable, resize set 80 ppt 80 ppt, move position top'
