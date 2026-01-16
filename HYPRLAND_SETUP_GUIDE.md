# Hyprland Setup Guide

Complete guide for setting up Hyprland with i3-compatible keybindings on Fedora and Arch Linux.

## Overview

This configuration provides a smooth transition from i3 to Hyprland by:
- Preserving all i3 keybindings
- Using Waybar to replace i3status-rust
- Maintaining the Catppuccin Mocha theme
- Supporting scratchpads via special workspaces
- Working on both Fedora and Arch Linux

## Prerequisites

Before installing Hyprland, ensure you have completed the initial dotfiles setup:

```bash
cd ~/.dotfiles
./stow.sh
```

This sets up the base configuration including bash, nvim, tmux, etc.

## Installation

### Fedora Installation

```bash
# Update system
sudo dnf update -y

# Install Hyprland and core dependencies
sudo dnf install -y \
    hyprland \
    waybar \
    rofi-wayland \
    swaybg \
    hyprlock \
    hypridle \
    dunst \
    polkit-gnome \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk

# Install tools
sudo dnf install -y \
    brightnessctl \
    pavucontrol \
    blueman \
    network-manager-applet \
    wl-clipboard \
    grim \
    slurp

# Optional: Screenshot tools
sudo dnf install -y flameshot
```

### Arch Installation

```bash
# Update system
sudo pacman -Syu

# Install Hyprland and core dependencies
sudo pacman -S --noconfirm \
    hyprland \
    waybar \
    rofi \
    swaybg \
    hyprlock \
    hypridle \
    dunst \
    polkit-gnome \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk

# Install tools
sudo pacman -S --noconfirm \
    brightnessctl \
    pavucontrol \
    blueman \
    network-manager-applet \
    wl-clipboard \
    grim \
    slurp

# Optional: Screenshot tools
sudo pacman -S --noconfirm flameshot
```

## Stow Configuration

After installing the packages, stow the Hyprland and Waybar configurations:

```bash
cd ~/.dotfiles
stow -v -R -t ~ hypr
stow -v -R -t ~ waybar
```

Or re-run the complete stow script (which now includes hypr and waybar):

```bash
cd ~/.dotfiles
./stow.sh
```

## First Launch

### From Display Manager (GDM/SDDM/LightDM)

1. Log out of your current session
2. At the login screen, select "Hyprland" from the session menu
3. Log in

### From TTY

If you don't use a display manager, add this to your `~/.bash_profile`:

```bash
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec Hyprland
fi
```

Then:
```bash
source ~/.bash_profile
```

### Test Without Committing

You can test Hyprland from within an existing X11 or Wayland session:

```bash
Hyprland
```

Exit with `Super+Shift+E` to return to your previous session.

## Verifying the Setup

Once Hyprland launches, verify:

1. **Waybar is visible** at the bottom of the screen
2. **Wallpaper is set** (random from `~/.config/backgrounds/`)
3. **System tray icons** appear (network, bluetooth)
4. **Keybindings work**:
   - `Super+Return` → Opens kitty terminal
   - `Super+D` → Opens rofi launcher
   - `Super+B` → Opens Brave browser

## Key Bindings Reference

All i3 keybindings are preserved. Here's a quick reference:

### Window Management
- `Super+H/J/K/L` - Move focus (vim keys)
- `Super+Shift+H/J/K/L` - Move window
- `Super+F` - Toggle fullscreen
- `Super+Shift+Space` - Toggle floating
- `Super+Shift+Q` - Kill window

### Workspaces
- `Super+1-9,0` - Switch workspace
- `Super+Shift+1-9,0` - Move window to workspace
- `Super+Shift+>` - Move workspace to right monitor
- `Super+Shift+<` - Move workspace to left monitor

### Applications
- `Super+Return` - Terminal (kitty)
- `Super+D` - App launcher (rofi)
- `Super+Space` - Window switcher
- `Super+B` - Browser (Brave)
- `Super+P` - Screenshot (flameshot)
- `Super+Shift+S` - Screencast toggle

### Scratchpads
- `Alt+Super+T` - Tmux
- `Alt+Super+C` - Calculator
- `Alt+Super+P` - Python REPL
- `Alt+Super+Y` - Yazi file manager
- `Alt+Super+B` - Btop system monitor
- `Alt+Super+M` - Neomutt email

### System
- `Ctrl+Super+L` - Lock screen
- `Super+R` - Resize mode
- `Super+Shift+E` - Exit Hyprland

## Configuration Files

Your Hyprland configuration is in:

```
~/.config/hypr/
├── hyprland.conf          # Main configuration
├── hyprlock.conf          # Lock screen config
└── scripts/
    ├── launch_scratchpad.sh
    ├── start_brave_browser.sh
    └── wallpaper.sh
```

Waybar configuration:

```
~/.config/waybar/
├── config                 # Module configuration
└── style.css             # Catppuccin theme styling
```

## Customization

### Monitor Configuration

Edit `~/.config/hypr/hyprland.conf`:

```conf
monitor=DP-1,1920x1080@60,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1
```

For auto-detection:
```conf
monitor=,preferred,auto,1
```

### Changing Wallpapers

Place wallpapers in `~/.config/backgrounds/`. The wallpaper script selects a random one on startup.

To manually change:
```bash
~/.config/hypr/scripts/wallpaper.sh
```

### Waybar Customization

**Change position:** Edit `~/.config/waybar/config`
```json
"position": "top"  // or "bottom"
```

**Modify modules:** Edit the `modules-left`, `modules-center`, `modules-right` arrays.

**Change colors:** Edit `~/.config/waybar/style.css`.

## Troubleshooting

### Screen sharing not working

```bash
# Ensure portal is installed
sudo dnf install xdg-desktop-portal-hyprland  # Fedora
sudo pacman -S xdg-desktop-portal-hyprland    # Arch

# Restart portals
systemctl --user restart xdg-desktop-portal-hyprland
systemctl --user restart xdg-desktop-portal
```

### Waybar not showing

```bash
# Check if running
pgrep waybar

# Restart manually
killall waybar
waybar &
```

### Apps not using Wayland

Check environment variables in `hyprland.conf`:
```conf
env = QT_QPA_PLATFORM,wayland
env = GDK_BACKEND,wayland
```

### Lock screen not working

```bash
# Ensure hyprlock is installed
which hyprlock

# Test manually
hyprlock
```

### Scratchpads not appearing

The scratchpad script uses special workspaces. If windows don't appear:

```bash
# Check if the class is set correctly
hyprctl clients | grep scratchpad

# Manually move a window to scratchpad
hyprctl dispatch movetoworkspace special:scratch
```

## Differences from i3

While keybindings are identical, some behaviors differ:

1. **Layouts:** Hyprland uses `master` and `dwindle` instead of i3's `stacking` and `tabbed`
2. **Scratchpads:** Implemented via special workspaces, not i3's native scratchpad
3. **Compositor:** Built-in, no need for picom
4. **Wallpapers:** Uses `swaybg` instead of `feh`
5. **Window rules:** Different syntax but same functionality

## Performance Tips

### Reduce animations

Edit `~/.config/hypr/hyprland.conf`:
```conf
animations {
    enabled = false
}
```

### Disable blur

```conf
decoration {
    blur {
        enabled = false
    }
}
```

### Lower refresh rate

```conf
monitor=,preferred,auto,1,vrr,0
```

## Switching Between Window Managers

You can keep both i3 and Hyprland installed:

- **i3 (X11):** Select "i3" at login screen
- **Hyprland (Wayland):** Select "Hyprland" at login screen

Both share the same dotfiles structure and will use their respective configurations.

## Additional Resources

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Documentation](https://github.com/Alexays/Waybar/wiki)
- [Catppuccin Theme](https://github.com/catppuccin/hyprland)

## Getting Help

If you encounter issues:

1. Check Hyprland logs: `journalctl --user -u hyprland`
2. Check Waybar logs: `waybar --log-level debug`
3. Verify configuration syntax: `hyprctl reload`

## Next Steps

1. **Configure monitors:** Set up your multi-monitor configuration
2. **Customize Waybar:** Add/remove modules as needed
3. **Set up auto-start apps:** Edit `hyprland.conf` exec-once section
4. **Create workspace rules:** Assign apps to specific workspaces
5. **Explore plugins:** Hyprland supports community plugins

Enjoy your new Hyprland setup!
