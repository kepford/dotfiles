#!/bin/bash

# Set random wallpaper from backgrounds directory
# Using swaybg for Wayland (Hyprland)

WALLPAPER_DIR="$HOME/.config/backgrounds"

if [ -d "$WALLPAPER_DIR" ]; then
    # Pick a random wallpaper
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

    if [ -n "$WALLPAPER" ]; then
        # Kill existing swaybg instances
        killall swaybg 2>/dev/null

        # Set wallpaper with swaybg
        swaybg -i "$WALLPAPER" -m fill &
    fi
fi
