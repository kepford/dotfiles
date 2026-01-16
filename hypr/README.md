# Hyprland Configuration

This is a Hyprland configuration that mirrors the i3 window manager keybindings and workflow. It uses Waybar for the status bar and is designed to work on both Fedora and Arch Linux.

## Features

- **i3-compatible keybindings** - All i3 keybindings are replicated in Hyprland
- **Catppuccin Mocha theme** - Matching color scheme with i3 config
- **Scratchpads** - Special workspaces for quick access to terminal apps
- **Waybar integration** - Status bar with system information
- **Random wallpapers** - Auto-selects random wallpaper from backgrounds directory

## Installation

### Fedora

```bash
# Install Hyprland and dependencies
sudo dnf install hyprland waybar rofi-wayland swaybg hyprlock dunst \
    polkit-gnome xdg-desktop-portal-hyprland brightnessctl pavucontrol \
    blueman network-manager-applet

# Install optional tools
sudo dnf install flameshot grim slurp wl-clipboard

# Stow the configuration
cd ~/.dotfiles
stow -v -R -t ~ hypr waybar
```

### Arch

```bash
# Install Hyprland and dependencies
sudo pacman -S hyprland waybar rofi swaybg hyprlock dunst \
    polkit-gnome xdg-desktop-portal-hyprland brightnessctl \
    pavucontrol blueman network-manager-applet

# Install optional tools
sudo pacman -S flameshot grim slurp wl-clipboard

# Stow the configuration
cd ~/.dotfiles
stow -v -R -t ~ hypr waybar
```

## First Launch

1. **From Login Manager**: Select "Hyprland" from your display manager (GDM, SDDM, etc.)

2. **From TTY** (if no display manager):
   ```bash
   # Add to ~/.bash_profile or ~/.zprofile
   if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
       exec Hyprland
   fi
   ```

3. **Test before committing**: You can test Hyprland from an existing session:
   ```bash
   Hyprland
   ```

## Key Bindings (Same as i3)

All keybindings from i3 are preserved:

### Essential
- `Super + Return` - Launch terminal (kitty)
- `Super + D` - Application launcher (rofi)
- `Super + Space` - Window switcher (rofi combi)
- `Super + B` - Launch Brave browser
- `Super + Shift + Q` - Kill focused window
- `Ctrl + Super + L` - Lock screen

### Window Navigation (Vim-style)
- `Super + H/J/K/L` - Focus left/down/up/right
- `Super + Shift + H/J/K/L` - Move window left/down/up/right

### Workspaces
- `Super + 1-9,0` - Switch to workspace
- `Super + Shift + 1-9,0` - Move window to workspace
- `Super + Shift + >` - Move workspace to right monitor
- `Super + Shift + <` - Move workspace to left monitor

### Layouts
- `Super + F` - Toggle fullscreen
- `Super + Shift + Space` - Toggle floating
- `Super + S` - Master layout
- `Super + W` - Dwindle layout (tiling)
- `Super + E` - Toggle split

### Resize Mode
- `Super + R` - Enter resize mode
  - `H/J/K/L` - Resize window
  - `Escape/Return` - Exit resize mode

### Scratchpads
- `Alt + Super + T` - Tmux scratchpad
- `Alt + Super + C` - Calculator scratchpad
- `Alt + Super + P` - Python scratchpad
- `Alt + Super + Y` - Yazi file manager scratchpad
- `Alt + Super + B` - Btop system monitor scratchpad
- `Alt + Super + M` - Neomutt email scratchpad

### Media Keys
- `XF86AudioRaiseVolume` - Increase volume
- `XF86AudioLowerVolume` - Decrease volume
- `XF86AudioMute` - Mute/unmute audio
- `XF86MonBrightnessUp` - Increase brightness
- `XF86MonBrightnessDown` - Decrease brightness

### Screenshots
- `Super + P` - Flameshot GUI (interactive screenshot)
- `Super + Shift + S` - Start/stop screencast recording

## Configuration Files

- `~/.config/hypr/hyprland.conf` - Main Hyprland configuration
- `~/.config/hypr/hyprlock.conf` - Lock screen configuration
- `~/.config/hypr/scripts/` - Helper scripts
  - `launch_scratchpad.sh` - Scratchpad launcher
  - `start_brave_browser.sh` - Brave browser launcher
  - `wallpaper.sh` - Random wallpaper setter

## Differences from i3

1. **Scratchpads** - Use Hyprland's special workspaces instead of i3's native scratchpad
2. **Layouts** - Hyprland has different layout options (master/dwindle vs stacking/tabbed)
3. **Window rules** - Configured differently but achieve the same results
4. **Compositor** - Built-in, no need for picom
5. **Wallpapers** - Uses swaybg instead of feh

## Troubleshooting

### Screen sharing not working
```bash
# Install xdg-desktop-portal-hyprland
sudo dnf install xdg-desktop-portal-hyprland  # Fedora
sudo pacman -S xdg-desktop-portal-hyprland    # Arch
```

### Waybar not showing
```bash
# Check if waybar is running
pgrep waybar

# Restart waybar
killall waybar && waybar &
```

### Environment variables not set
Some applications may need explicit Wayland support. Check `hyprland.conf` env variables section.

### Lock screen not working
```bash
# Make sure hyprlock is installed
sudo dnf install hyprlock      # Fedora
sudo pacman -S hyprlock         # Arch
```

## Customization

### Monitor Configuration
Edit `hyprland.conf` and modify the monitor section:
```
monitor=DP-1,1920x1080@60,0x0,1
monitor=HDMI-A-1,1920x1080@60,1920x0,1
```

### Change Wallpaper Directory
Edit `~/.config/hypr/scripts/wallpaper.sh` and change `WALLPAPER_DIR`.

### Modify Status Bar
Edit `~/.config/waybar/config` and `~/.config/waybar/style.css`.

## Additional Resources

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin)
