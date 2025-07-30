####################
# DO NOT RUN AS SUDO
####################

# sudo nano /etc/dnf/dnf.conf
# fastestmirror=True
# max_parallel_downloads=5
# defaultyes=True
# keepcache=True

# run updates `sudo dnf update`
sudo dnf update -y

# Enabling the RPM Fusion repositories
# https://rpmfusion.org/Configuration
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E fedora).noarch.rpm -y
sudo dnf groupupdate core -y

# Install Media Codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

# sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install gstreamer1-libav
# sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install x265-libs libde265
# sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# sudo dnf list installed x265-libs libde265

# Deprecated
# Installing plugins for playing movies and music
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/

# sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
# sudo dnf install lame\* --exclude=lame-devel -y
# sudo dnf group upgrade --with-optional Multimedia -y

# Flatpak https://flatpak.org/setup/Fedora
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# sudo hostnamectl set-hostname "Fedora_RH" -y

# Install Gnome apps
sudo dnf install gnome-tweaks -y

# Add min/max/close buttons to right top of windows
# gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

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

# Scale the text size up by 75%
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.25

# Disable Bluetooth power on boot.
# sudo vim /etc/tlp.conf
# DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"

# Setup gnu-stow
sudo dnf install stow -y

# install vim
sudo dnf install vim -y
sudo dnf install fastfetch -y

# install keychain
sudo dnf install keychain -y

# Install Alacritty
sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++ -y
sudo dnf install alacritty -y

sudo dnf install kitty -y

# sudo dnf install gnome-tweak-tool
# Settings in Firefox: https://extensions.gnome.org/local/

# Install Brave Browswer
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

# Install chromium
sudo dnf install chromium -y

# Fedora 41 and newer
# Add the Mullvad repository server to dnf
# sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# Fedora 40 and earlier
# Add the Mullvad repository server to dnf
# sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo -y

# Install the package
sudo dnf install mullvad-browser -y

# Syncthing #
sudo dnf install syncthing -y

# Start and enable on boot.
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

# Power management
# sudo dnf install powertop
# sudo powertop --auto-tune
# sudo systemctl enable powertop

# sudo dnf install tlp tlp-rdw
# sudo systemctl enable tlp

# sudo vim /etc/tlp.conf
# Add this config
# PCIE_ASPM_ON_BAT=powersupersave

# My coding fonts
sudo dnf install fira-code-fonts -y

# GPU rendering with Firefox
# sudo dnf install igt-gpu-tools -y
# Ensure that intel_gpu_top is showing GPU usage when watching video on browser.
# Firefox 92 → about:config → layers.acceleration.force-enabled

sudo dnf install tidy -y
# sudo dnf install php  -y
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
# php composer-setup.php
# php -r "unlink('composer-setup.php');"

# Install coder for phpcs
# composer global require drupal/coder
# composer global require drupal/coder dealerdirect/phpcodesniffer-composer-installer
# phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
# sudo mv composer.phar ~/.local/bin/composer

sudo dnf install the_silver_searcher -y

# Clipboard support for Tmux and Vim
dnf install xclip -y # Need to run `hostname | xclip -sel c`

# Docker #
# https://docs.docker.com/engine/install/fedora/
sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Run docker as norm user
sudo groupadd docker
sudo usermod -aG docker $USER

# Ddev #
echo '[ddev]
name=DDEV Repo
baseurl=https://pkg.ddev.com/yum/
enabled=1
gpgcheck=0' | sudo tee -a /etc/yum.repos.d/ddev.repo

sudo dnf install --refresh ddev -y

sudo dnf install gvim -y

# Install fzf using git to get the latest version
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# sudo dnf install fzf -y

# git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

sudo dnf install bash-completion -y

# Setup Starship
sudo dnf copr enable atim/starship
sudo dnf install starship

sudo dnf install bat -y
sudo dnf install lynx -y
sudo dnf install atool -y
sudo dnf install mediainfo -y
# sudo dnf install ffmpegthumbnailer -y
sudo dnf install cmake -y
sudo dnf install odt2txt -y
sudo dnf install pdftoppm -y
sudo dnf install zathura -y
sudo dnf install zathura-pdf-poppler -y
sudo dnf install mpv -y
sudo dnf install ctags -y
sudo dnf install ffmpeg-free -y
sudo dnf install sxiv -y
sudo dnf install libreoffice -y
sudo dnf install mpd -y
# sudo dnf install flex -y
# sudo dnf install fontconfig -y
# sudo dnf install freetype -y
# sudo dnf install glib -y
# sudo dnf install go -y

# Added for my footswitch.
# Download and install https://github.com/rgerganov/footswitch
# brew install hidapi
#
#
#Virtualization https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/
sudo dnf install @virtualization
sudo dnf group install --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

sudo dnf install krb5-workstation -y

##################################
# Top tools ######################
##################################
sudo dnf install htop -y
sudo dnf install btop -y
# test and stress test your CPU and fans on a new system.
sudo dnf install s-tui -y
sudo dnf install atop -y
# Monitors bandwidth 
sudo dnf install iftop -y
# Disk bandwidth.
sudo dnf install iotop -y
sudo dnf install nvtop -y
sudo dnf install perf -y
sudo dnf install wavemon -y
sudo dnf install iperf -y

sudo dnf install jq -y
sudo dnf install jo -y
# Used by telescope.nvim
sudo dnf install fd-find -y
sudo dnf install ripgrep -y
sudo dnf install neovim -y
# for doing math in Vim with !!calc -p or :.!calc -p
sudo dnf install calc -y
sudo dnf install python3-neovim -y
sudo dnf install nmap -y
sudo dnf install pv -y
sudo dnf install readline -y
sudo dnf install sshuttle -y
sudo dnf install tig -y
sudo dnf install tmux -y
sudo dnf install tree -y
sudo dnf install youtube-dl -y
sudo dnf install wireguard-tools -y
sudo dnf install zoxide -y
sudo dnf copr enable marcusmueller/sc-im # CLI spreadsheet tool
sudo dnf --refresh install sc-im -y
sudo dnf install calcurse -y # Calendar
sudo dnf install newsboat -y

# Remind
# curl https://dianne.skoll.ca/projects/remind/download/remind-04.02.00.tar.gz -o remind-04.02.00.tar.gz
# tar xfz remind-04.02.00.tar.gz && cd remind-04.02.00 && ./configure && make && make test && sudo make install

# tty-clock
git clone https://github.com/xorg62/tty-clock
cd tty-clock
sudo dnf install ncurses ncurses-devel -y
make
chmod +x tty-clock
sudo mv tty-clock /usr/local/bin/tty-clock
# tty-clock -cbt

# Weather
# curl wttr.in/Caruthers?format=4
# Caruthers: 🌦   🌡️+53°F 🌬️↖11mph

# Neomutt Wizard dep
sudo dnf install neomutt -y
sudo dnf install isync msmtp pass -y
sudo dnf install lynx notmuch abook urlview -y
sudo dnf install pass-otp # not required but useful

# Mutt wizard
cd /tmp
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install

# Copy the pass files password-store
# cp -rp /backup/bkepford/.password-store ~/.

# Copy the mail dir
# cp -rp /backup/bkepford/.local/share/mail ~/.local/share/.

# Copy notmuch-config
# cp -p /backup/bkepford/.notmuch-config ~/.

# Copy mbsync
# cp -p /backup/bkepford/.mbsync ~/.

# Screencasting tools
sudo dnf install screenkey -y

# Set up cron
sudo dnf install cronie -y
sudo systemctl start crond.service
sudo systemctl enable crond.service

# Install git-delta A syntax-highlighting pager for git, diff, grep, and blame 
# output. Replaced diff-so-fancy
sudo dnf install git-delta -y

# Yubikey management cli
sudo dnf install yubikey-manage -y

sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo dnf install tailscale
sudo systemctl enable --now tailscaled

sudo dnf install python3-pip -y

# For screenshots
sudo dnf install flameshot -y

# Sway for Wayland
sudo dnf install sway-config-fedora -y

# i3 for X11
sudo dnf install i3 rofi picom feh blueman pavucontrol xset xinput dunst -y
sudo dnf copr enable atim/i3status-rust -y
sudo dnf install i3status-rust -y
sudo dnf install brightnessctl -y

# Rust cargo stuff
rustup update

# Install yazi file manager
cargo install --locked yazi-fm yazi-cli

# Install helpers for yazi
sudo dnf install unar -y

# Auto detect the monitors and set up xrandr/displays as desired.
sudo dnf install autorandr -y

sudo dnf install tldr -y
sudo dnf install ncdu -y

# Load laptop only display
# autorandr mobile
# Load dock in my office
# autorandr dock
# Load KMF
# autorandr kmf

# Install Flatpaks
flatpak install flathub org.signal.Signal
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.bitwarden.desktop
flatpak install flathub org.kde.kdenlive
flatpak install flathub com.calibre_ebook.calibre
flatpak install flathub com.yubico.yubioath
flatpak install flathub com.discordapp.Discord
