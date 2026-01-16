# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed with GNU Stow for Linux systems (primarily Fedora and Arch). The configuration supports both X11 (i3) and Wayland (Sway) window managers, with a focus on terminal-based workflows using Neovim, Tmux, and various CLI tools.

## Installation and Setup

### Initial Setup
```bash
# Run the stow script to symlink all configs
./stow.sh

# For Fedora systems
./fedora.sh

# For Arch systems
./arch.sh
```

The `stow.sh` script backs up existing `.bashrc` and `.bash_profile`, then uses GNU Stow to symlink configuration directories to the home directory.

### Prerequisites (Manual Steps)

Before running stow, certain manual setup is required:

1. **Fonts**: Install FiraCode Nerd Font to `/usr/share/fonts/` and run `fc-cache -v`
2. **NVM**: Install Node Version Manager for Neovim plugins
3. **Git**: Create `~/.gitconfig_local` with user email and name
4. **Bash**: Create `~/.bash_local` for local bash config
5. **Tmux**: Clone TPM (Tmux Plugin Manager) and Catppuccin theme:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   mkdir -p ~/.config/tmux/plugins/catppuccin
   git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
   ```

## Architecture

### Stow-based Structure

Each top-level directory is a "stow package" that gets symlinked to `$HOME`:
- `bash/` → Shell configuration (sources from `.config/bash/`)
- `nvim/` → Neovim configuration (Lua-based with lazy.nvim)
- `hypr/` → Hyprland window manager config (Wayland)
- `i3/` → i3 window manager config (X11)
- `sway/` → Sway window manager config (Wayland, i3-compatible)
- `waybar/` → Waybar status bar for Hyprland
- `i3status-rust/` → Status bar for i3/Sway
- `tmux/` → Tmux configuration
- `local-bin/` → Custom scripts in `~/.local/bin/`
- `starship/` → Starship prompt configuration
- `kitty/`, `alacritty/` → Terminal emulator configs
- Others: `git/`, `rofi/`, `yazi/`, `autorandr/`, etc.

### Bash Configuration

The bash setup is modular:
- `.bashrc` → sources `.config/bash/bashrc`
- `.config/bash/bashrc` → sources `env`, `config`, `aliases` and initializes starship
- Local overrides go in `~/.bash_local`

**Module breakdown:**
- `env` - EDITOR=nvim, BROWSER=firefox, PATH configuration (NVM, Cargo, Composer), fzf/zoxide setup
- `config` - Bash history (500k entries), vi keybindings, color definitions, NVM auto-use
- `aliases` - 200+ aliases including git shortcuts, `vim=nvim`, `reload`, `ea` (edit aliases)

### Neovim Structure

Neovim config uses lazy.nvim plugin manager with this structure:
- `nvim/.config/nvim/init.lua` → Entry point
- `nvim/.config/nvim/lua/kepford/` → Main config namespace
  - `core/` → Options, keymaps, init
  - `plugins/` → Individual plugin configurations
  - `lazy.lua` → Plugin manager setup

**Key plugins:**
- LSP: lspconfig (deprecated API, warning suppressed), mason (package manager)
- Completion: nvim-cmp, autopairs
- UI: lualine, noice, alpha-nvim, neo-tree, telescope
- Tools: treesitter, nvim-dap, render-markdown, markdown-preview
- Git: fugitive, github-tasks
- Utilities: undotree, which-key, oil

**Note on nvim-lspconfig:** The configuration currently uses the deprecated `require('lspconfig')` API. The deprecation warning is suppressed in `plugins/lsp/lspconfig.lua` until migration to `vim.lsp.config` (nvim 0.11+ native API) is completed. The old API still works but will be removed in nvim-lspconfig v3.0.0.

### i3 Window Manager (X11)

Key bindings in i3:
- `$mod` = Super/Windows key
- `$mod+Return` → Launch kitty terminal
- `$mod+b` → Launch Brave browser
- `$mod+p` → Flameshot screenshot
- `$mod+Shift+s` → Toggle screencast recording
- `$mod+d` → Rofi app launcher

### Sway Window Manager (Wayland)

Wayland alternative to i3 with similar keybindings. Configuration in `sway/.config/sway/config`. Sway uses i3-compatible syntax but runs natively on Wayland, avoiding X11 compatibility layers.

### Hyprland Window Manager (Wayland)

Modern Wayland compositor with i3-compatible keybindings configured in `hypr/.config/hypr/hyprland.conf`.

**Key features:**
- All i3 keybindings preserved ($mod = Super key)
- Built-in compositor with animations and blur effects
- Catppuccin Mocha theme matching i3 config
- Waybar status bar (replaces i3status-rust)
- Special workspaces for scratchpads
- Hyprlock for screen locking

**Installation:**
```bash
# Fedora
sudo dnf install hyprland waybar rofi-wayland swaybg hyprlock dunst \
    polkit-gnome xdg-desktop-portal-hyprland

# Arch
sudo pacman -S hyprland waybar rofi swaybg hyprlock dunst \
    polkit-gnome xdg-desktop-portal-hyprland

# Stow configuration
cd ~/.dotfiles && stow -v -R -t ~ hypr waybar
```

**Configuration files:**
- `~/.config/hypr/hyprland.conf` - Main config
- `~/.config/hypr/hyprlock.conf` - Lock screen
- `~/.config/hypr/scripts/` - Helper scripts
- `~/.config/waybar/config` - Status bar config
- `~/.config/waybar/style.css` - Status bar styling

### Tmux Configuration

Terminal multiplexer with vi keybindings and Catppuccin theme.

**Key bindings:**
- Prefix: `Ctrl+a`
- `Ctrl+hjkl` → Vim-aware pane navigation
- `|` and `-` → Split panes (vertical/horizontal, preserves current path)
- `Ctrl+j` → fzf session switcher
- `y` / `Enter` → Copy to clipboard (XClip integration)

**Configuration:** `~/.config/tmux/tmux.conf`
- 256-color terminal with RGB support
- Vi mode for copy/paste
- TPM (Tmux Plugin Manager) for plugin management
- Yazi file manager integration via passthrough

## Espanso Text Expansion

Recently added text expansion tool configured in `espanso/` package.

**Configuration location:** `~/.config/espanso/match/base.yml`

Provides keyboard shortcuts and text snippets for productivity. After stowing, enable espanso service:
```bash
espanso service register
espanso service start
```

## Custom Scripts

### screencast.sh

Located in `local-bin/.local/bin/screencast.sh` - Multi-monitor screen recording script.

**Usage:**
```bash
# Interactive mode (foreground)
screencast.sh                    # Press 'q' to stop
screencast.sh -n                 # No audio
screencast.sh -m HDMI-1          # Specific monitor

# Background mode (toggle on/off)
screencast.sh -b                 # Start/stop toggle
screencast.sh -b -n              # Background without audio
```

**Features:**
- Auto-detects monitors via xrandr
- Interactive selection (rofi/dmenu/fzf/bash select)
- Foreground mode: Press 'q' or Ctrl+C to stop
- Background mode: Run again to stop (acts as toggle)
- Output: `~/Videos/Screencasts/screencast-YYYY-MM-DD_HHMMSS.mkv`

### web2app.sh / web2app-remove.sh

Scripts for converting web apps to standalone desktop applications using Chromium browsers. Requires `wmctrl` to detect existing window instances.

**Usage:**
```bash
# Create web app desktop entries (40+ apps)
./web2app.sh

# Remove web app desktop entries
./web2app-remove.sh
```

**Function signature (from bash aliases):**
```bash
web2app "AppName" "URL" "IconURL"
web2app-remove "AppName"
```

Creates desktop entries for work apps (Google Calendar, Gmail, Jira, GitLab), personal services (Nextcloud, Feedbin, Umbrel, Alby Hub), and self-hosted tools (n8n, Uptime Kuma, Syncthing, Pi-hole).

## Development Tools

### Package Management

**Fedora:**
- DNF for system packages
- Flatpak for sandboxed apps
- Cargo for Rust tools (yazi, etc.)

**Arch:**
- pacman for system packages
- yay for AUR packages
- Flatpak and Cargo

### Key Tools Installed

- **Editor**: Neovim with LSP support (via Mason)
- **Shell**: Bash with starship prompt, fzf, zoxide
- **File Management**: yazi (file manager), fd, ripgrep
- **Git**: git-delta (diff viewer), tig
- **Containers**: Docker, DDEV (for Drupal development)
- **VPN**: Tailscale, Mullvad Browser
- **Email**: neomutt with mutt-wizard
- **Music**: mpd with rmpc client
- **Development**: Node (via nvm), Python, Rust, PHP/Composer

### Monitor Management

Uses `autorandr` to save/load monitor configurations:
```bash
autorandr --save <profile-name>    # Save current setup
autorandr <profile-name>           # Load saved profile
```

Common profiles referenced: `mobile`, `dock`, `kmf`, `think`, `think-dock`

## Platform-Specific Notes

### Fedora
- Enables RPM Fusion repositories for multimedia codecs
- Configures GNOME touchpad settings via gsettings
- Sets up natural scrolling, touchpad speed, caps→escape mapping
- Power management with TLP (commented out by default)

### Arch
- Uses yay as AUR helper
- Requires manual confirmation for some package installs
- Bluetooth setup requires manual bluetoothctl configuration

### X11 Configuration
- X resources: Load with `xrdb -merge ~/.dotfiles/x/xresources`
- Natural scrolling configured in `/usr/share/X11/xorg.conf.d/40-libinput.conf`
- Trackpad acceleration set via `xinput` commands (see README for device-specific examples)
- Caps Lock → Escape mapping handled by xmodmap in i3 config

## Important Paths

- Dotfiles root: `~/.dotfiles/`
- Custom scripts: `~/.local/bin/`
- Bash config: `~/.config/bash/`
- Neovim config: `~/.config/nvim/`
- Screen recordings: `~/Videos/Screencasts/`
- Tmux plugins: `~/.tmux/plugins/tpm`, `~/.config/tmux/plugins/catppuccin/tmux`
- Git local config: `~/.gitconfig_local`
- Bash local config: `~/.bash_local`

## Common Workflows

### Adding/Updating Stow Packages

```bash
# Add a new package
cd ~/.dotfiles
mkdir -p new-package/.config/new-package
# Add your config files
stow -v -R -t ~ new-package

# Update existing package (test first)
stow -nv -R -t ~ existing-package  # Dry run
stow -v -R -t ~ existing-package   # Apply

# Remove a package
stow -v -D -t ~ package-name
```

### Git Configuration

Git setup uses a two-file approach:
- `~/.dotfiles/git/.gitconfig` - Shared config (versioned)
- `~/.gitconfig_local` - Local overrides (not versioned, created manually)

The shared config includes git-delta for diffs, custom aliases, and formatting. Create `~/.gitconfig_local` with:
```ini
[user]
    email = your.email@example.com
    name = Your Name
```

### Tmux Plugin Management

```bash
# Install plugins (after stowing tmux config)
# Inside tmux session, press: Ctrl+a I (capital I)

# Update plugins
# Inside tmux session, press: Ctrl+a U

# Or manually
cd ~/.tmux/plugins/tpm && git pull
```

## Testing Commands

When making changes to this repository:

1. **Test stow changes:**
   ```bash
   cd ~/.dotfiles
   # Dry run to see what would happen
   stow -nv -R -t ~ <package-name>
   # Actually apply
   stow -v -R -t ~ <package-name>
   ```

2. **Reload bash config:**
   ```bash
   source ~/.bashrc
   ```

3. **Reload i3 config:**
   - `$mod+Shift+c` (reload)
   - `$mod+Shift+r` (restart)

4. **Test Neovim config:**
   ```bash
   nvim --headless "+Lazy! sync" +qa
   ```

5. **Test espanso config:**
   ```bash
   espanso restart
   # Check status
   espanso status
   ```

6. **Test Hyprland config:**
   ```bash
   # Check syntax without launching
   hyprctl reload

   # Reload waybar
   killall waybar && waybar &

   # Test from TTY or existing session
   Hyprland
   ```

## Additional Notes

### Language Environments

- **Node.js**: Managed via NVM (v22.15.1 referenced in README). NVM auto-switches versions based on `.nvmrc` files (configured in bash `config`).
- **Python**: System Python with pip, user base path configured in `env`.
- **Rust**: Installed via rustup, cargo bin in PATH.
- **PHP**: Composer with global vendor/bin in PATH for tools like DDEV.

### DDEV (Drupal Development)

DDEV is configured for local Drupal development. Uses Docker containers for isolated environments.

```bash
ddev start       # Start project
ddev stop        # Stop project
ddev ssh         # SSH into container
```
