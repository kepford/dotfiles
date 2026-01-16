# Waybar Configuration

Status bar for Hyprland that mirrors the i3status-rust layout.

## Features

- **Catppuccin Mocha theme** - Matching color scheme
- **System monitoring** - CPU, memory, disk, battery
- **Custom modules** - Caffeine mode, Syncthing status
- **Interactive elements** - Click to open related apps

## Modules

### Left Side
- **Workspaces** - Hyprland workspace indicator
- **Window** - Active window title

### Right Side
- **Caffeine** - DPMS status toggle (keeps screen awake)
- **Syncthing** - Syncthing daemon status
- **CPU** - CPU usage with warning/critical states
- **Disk** - Free disk space on root partition
- **Memory** - RAM usage percentage
- **Audio** - Volume control (click to open pavucontrol)
- **Battery** - Battery percentage and charging status
- **Power** - Power menu (suspend/shutdown/reboot)
- **Clock** - Date and time (click to open calcurse)

## Customization

### Change Position
Edit `~/.config/waybar/config`:
```json
"position": "top",  // or "bottom"
```

### Modify Modules
Add or remove modules in the `modules-left`, `modules-center`, or `modules-right` arrays.

### Change Colors
Edit `~/.config/waybar/style.css` to modify the Catppuccin theme colors.

## Dependencies

- Font: FiraCode Nerd Font Mono
- pavucontrol (audio control)
- calcurse (calendar)
- xset (for caffeine module)
- syncthing (optional)

## Reload Configuration

```bash
killall waybar && waybar &
```

Or use:
```bash
killall -SIGUSR2 waybar  # Reload without killing
```
