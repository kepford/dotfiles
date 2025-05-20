#################
# Arch install script
# https://wiki.archlinux.org/title/Lenovo_ThinkPad_T480
#################

# Maintenance script
# https://github.com/kurealnum/dotfiles/blob/main/.config/scripts/sysmaintenance.sh

# run updates 
sudo pacman -Syu

# Install fastfetch
sudo pacman -S fastfetch --noconfirm
sudo pacman -S git --noconfirm

# Install intel graphics
# sudo pacman -S xf86-video-intel
#
# Bluetooth doesn't work

# Install yay AUR helper
# @TODO: Requires input
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# After installation, you can use Yay to install, remove, and search for packages. For example, to install a package, you can use the -S option followed by the package name:

# yay -S package-name
# To remove a package, use the -R option:
# yay -R package-name
# For searching packages, you can use the -Ss option followed by a search term:
# yay -Ss search-term
# Yay also supports full system updates with the command:
# yay
#
# Keep packages updated by running yay -Sua

# Install inetutils so we can use `hostname`
sudo pacman -S inetutils --noconfirm

#################################
# Browsers
#################################

# Brave browser
yay -S brave-bin

# Install other browsers
# sudo pacman -S mullvad-browser firefox --noconfirm

# Install Python and Pip if they aren't installed
sudo pacman -S python python-pip --noconfirm

# Rust
sudo pacman -S rustup --noconfirm

# Rust cargo stuff
rustup update

###############
# Gnome Stuff
###############

# Set natural scroll
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# Set touchpad speed
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.43968871595330739

gsettings set org.gnome.desktop.peripherals.touchpad accel-profile 'default'
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad left-handed 'mouse'
gsettings set org.gnome.desktop.peripherals.touchpad middle-click-emulation false
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag-lock false
gsettings set org.gnome.desktop.peripherals.touchpad tap-button-map 'default'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true

# Maps capslock to escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Setup gnu-stow
sudo pacman -S stow --noconfirm

# install keychain
sudo pacman -S keychain --noconfirm

sudo pacman -S kitty --noconfirm

# @TODO Requires input
# Install fzf using git to get the latest version
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# sudo pacman -S fzf 

# git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

sudo pacman -S bash-completion --noconfirm
sudo pacman -S bat --noconfirm
sudo pacman -S lynx --noconfirm
sudo pacman -S atool --noconfirm
sudo pacman -S mediainfo --noconfirm
# sudo pacman -S ffmpegthumbnailer --noconfirm
sudo pacman -S cmake --noconfirm
sudo pacman -S odt2txt --noconfirm
sudo pacman -S pdftoppm --noconfirm
sudo pacman -S zathura --noconfirm
sudo pacman -S zathura-pdf-poppler --noconfirm
sudo pacman -S mpv --noconfirm
sudo pacman -S ctags --noconfirm
sudo pacman -S ffmpeg-free --noconfirm
sudo pacman -S sxiv --noconfirm
sudo pacman -S libreoffice --noconfirm
sudo pacman -S mpd --noconfirm
sudo pacman -S htop --noconfirm
sudo pacman -S jq --noconfirm
sudo pacman -S jo --noconfirm
# Used by telescope.nvim
sudo pacman -S fd-find --noconfirm
sudo pacman -S ripgrep --noconfirm
sudo pacman -S neovim --noconfirm
# for doing math in Vim with !!calc -p or :.!calc -p
sudo pacman -S calc --noconfirm
sudo pacman -S python3-neovim --noconfirm
sudo pacman -S nmap --noconfirm
sudo pacman -S pv --noconfirm
sudo pacman -S readline --noconfirm
sudo pacman -S sshuttle --noconfirm
sudo pacman -S tig --noconfirm
sudo pacman -S tmux --noconfirm
sudo pacman -S tree --noconfirm
sudo pacman -S youtube-dl --noconfirm
sudo pacman -S wireguard-tools --noconfirm
sudo pacman -S zoxide --noconfirm
# sudo dnf copr enable marcusmueller/sc-im # CLI spreadsheet tool
# sudo dnf --refresh install sc-im --noconfirm
sudo pacman -S calcurse --noconfirm # Calendar
sudo pacman -S newsboat --noconfirm
sudo pacman -S tidy --noconfirm
sudo pacman -S the_silver_searcher --noconfirm
sudo pacman -S tldr --noconfirm
sudo pacman -S ncdu --noconfirm

#############
# Syncthing #
#############
sudo pacman -S syncthing --noconfirm

# Start and enable on boot.
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# My coding fonts
sudo pacman -S fira-code-fonts --noconfirm


# Clipboard support for Tmux and Vim
# Need to run `hostname | xclip -sel c`
sudo pacman -S xclip --noconfirm 

##########
# Docker #
##########

sudo pacman -S docker --noconfirm
docker --version
sudo systemctl start docker

# Run docker as norm user
sudo groupadd docker
sudo usermod -aG docker $USER

# ##############
# Install DDEV
# ##############
# https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/#linux

# @TODO requires action
yay -S ddev-bin

# One-time initialization of mkcert
mkcert -install

# ###########
# tty-clock
# ###########

git clone https://github.com/xorg62/tty-clock
cd tty-clock
sudo pacman -S ncurses ncurses-devel --noconfirm
make
chmod +x tty-clock
sudo mv tty-clock /usr/local/bin/tty-clock
# tty-clock -cbt

# Weather
# curl wttr.in/Caruthers?format=4
# Caruthers: 🌦   🌡️+53°F 🌬️↖11mph

# Neomutt Wizard dep
sudo pacman -S neomutt --noconfirm
sudo pacman -S isync msmtp pass --noconfirm
sudo pacman -S lynx notmuch abook urlview --noconfirm
sudo pacman -S pass-otp --noconfirm

# Mutt wizard
cd /tmp
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install

# Copy the pass files password-store
# cp -rp /backup/kepford/.password-store ~/.

# Copy the mail dir
# cp -rp /backup/kepford/.local/share/mail ~/.local/share/.

# Copy notmuch-config
# cp -p /backup/kepford/.notmuch-config ~/.

# Copy mbsync
# cp -p /backup/kepford/.mbsync ~/.

# Screencasting tools
sudo pacman -S screenkey --noconfirm

# Set up cron
sudo pacman -S cronie --noconfirm
## @TODO: Failed service not found 
# sudo systemctl start crond.service
# sudo systemctl enable crond.service

# Install git-delta A syntax-highlighting pager for git, diff, grep, and blame 
# output. Replaced diff-so-fancy
sudo pacman -S git-delta --noconfirm

# Yubikey management cli
sudo pacman -S yubikey-manage --noconfirm

sudo pacman -S tailscale --noconfirm
sudo tailscale up
sudo systemctl enable --now tailscaled

# For screenshots
sudo pacman -S flameshot --noconfirm

# i3 for X11
sudo pacman -Sy xorg-xinit dmenu xorg-xset xorg-xinput --noconfirm

# Had some issues here
sudo pacman -Sy i3-wm --noconfirm
# Rofi is a window switcher, application launcher, and dmenu replacement
sudo pacman -Sy rofi --noconfirm 
# lightweight compositor for X11
sudo pacman -Sy picom --noconfirm 
sudo pacman -Sy feh --noconfirm
sudo pacman -Sy blueman --noconfirm # Bluetooth manager 
sudo pacman -Sy pavucontrol --noconfirm # PulseAudio Volume Control
sudo pacman -Sy dunst --noconfirm # Notifications
sudo pacman -Sy i3status-rust --noconfirm # status 
sudo pacman -Sy brightnessctl --noconfirm

###########################
# Install yazi file manager
###########################
# Falied to install yazi-fm
cargo install --locked yazi-fm yazi-cli

# Install helpers for yazi
sudo pacman -S unar --noconfirm

##############################
# Monitor management         #
#                            #
# Auto detect the monitors   #
# and set up xrandr/displays #
# as desired.                #
##############################
sudo pacman -S autorandr --noconfirm

# Load laptop only display
# autorandr mobile
# Load dock in my office
# autorandr dock
# Load KMF
# autorandr kmf

# Install Flatpaks
flatpak install flathub org.signal.Signal -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub com.calibre_ebook.calibre -y
flatpak install flathub com.yubico.yubioath -y
flatpak install flathub com.discordapp.Discord -y

########################
# VPNs
########################
# Mullvad
# @TODO asks for conf
# @TODO import certs
yay -S mullvad-vpn
