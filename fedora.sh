####################
# DO NOT RUN AS SUDO
####################

# sudo nano /etc/dnf/dnf.conf
sudo /bin/sh -c 'echo fastestmirror=True >> /etc/dnf/dnf.conf'
sudo /bin/sh -c 'echo max_parallel_downloads=5 >> /etc/dnf/dnf.conf'
sudo /bin/sh -c 'echo defaultyes=True >> /etc/dnf/dnf.conf'
sudo /bin/sh -c 'echo keepcache=True >> /etc/dnf/dnf.conf'

# run updates `sudo dnf update`
sudo dnf update -y

# Enabling the RPM Fusion repositories
# https://rpmfusion.org/Configuration
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E fedora).noarch.rpm -y
sudo dnf groupupdate core -y

# Install Media Codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

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
# Deprecated
# sudo dnf install gnome-tweaks -y

# Add min/max/close buttons to right top of windows
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

# Maps capslock to escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Scale the text size up by 75%
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
gsettings set org.gnome.desktop.interface text-scaling-factor 1.5

# Disable Bluetooth power on boot.
sudo /bin/sh -c "sed -i '/\[Policy\]/a AutoEnable=false' /etc/bluetooth/main.conf"


# Vim: YouCompleteMe plugin requirements
sudo dnf install cmake gcc-c++ make python3-devel -y

# install vim
sudo dnf install vim -y
sudo dnf install neofetch -y

# install keychain
sudo dnf install keychain -y

# Install Alacritty
sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++ -y
sudo dnf install alacritty -y

# sudo dnf install gnome-tweak-tool
# Settings in Firefox: https://extensions.gnome.org/local/

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

# Required for YouCompleteMe Vim plugin.
# Depreciated
# sudo dnf install cmake gcc-c++ make python3-devel -y

# GPU rendering with Firefox
sudo dnf install igt-gpu-tools -y
# Ensure that intel_gpu_top is showing GPU usage when watching video on browser.
# Firefox 92 → about:config → layers.acceleration.force-enabled

sudo dnf install tidy -y
sudo dnf install php php-process -y
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Install coder for phpcs
composer global require drupal/coder
composer global require drupal/coder dealerdirect/phpcodesniffer-composer-installer
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
sudo mv composer.phar ~/.local/bin/composer

# ALE CONFIG
#  Current Filetype: php.drupal
# Available Linters: ['intelephense', 'langserver', 'phan', 'php', 'phpcs', 'phpmd', 'phpstan', 'psalm', 'tlint']
#   Enabled Linters: ['php', 'phpcs']
#   Ignored Linters: []
#  Suggested Fixers:
#   'php_cs_fixer' - Fix PHP files with php-cs-fixer.
#   'phpcbf' - Fix PHP files with phpcbf.
#   'remove_trailing_lines' - Remove all blank lines at the end of a file.
#   'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
#  Linter Variables:
#
# let g:ale_php_cs_fixer_executable = 'php-cs-fixer'
# let g:ale_php_cs_fixer_options = ''
# let g:ale_php_cs_fixer_use_global = 0
# let g:ale_php_php_cs_fixer_executable = '~/.composer/vendor/bin/phpcbf'
# let g:ale_php_php_executable = 'php'
# let g:ale_php_phpcs_executable = '~/.composer/vendor/bin/phpcs'
# let g:ale_php_phpcs_options = ''
# let g:ale_php_phpcs_standard = 'Drupal'
# let g:ale_php_phpcs_use_global = 0

# Depreciated
# sudo dnf install the_silver_searcher -y

# Clipboard support for Tmux and Vim
dnf install xclip -y # Need to run `hostname | xclip -sel c`

# Docker #
# https://docs.docker.com/engine/install/fedora/

# Ddev #
# sudo apt install build-essential apt-transport-https ca-certificates software-properties-common curl
# curl -O https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh
# chmod +x install_ddev.sh
# ./install_ddev.sh

sudo dnf install fzf -y

# git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

sudo dnf install bash-completion -y
sudo dnf install bat -y
sudo dnf install lynx -y
sudo dnf install atool -y
sudo dnf install mediainfo -y
sudo dnf install ffmpegthumbnailer -y
sudo dnf install cmake -y
sudo dnf install odt2txt -y
sudo dnf install pdftoppm -y
sudo dnf install zathura -y
sudo dnf install zathura-pdf-poppler -y
sudo dnf install mpv -y
sudo dnf install ctags -y
sudo dnf install ffmpeg -y
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
sudo dnf install @virtualization -y
sudo dnf group install --with-optional virtualization -y
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

sudo dnf install krb5-workstation -y

sudo dnf install htop -y
sudo dnf install jq -y
sudo dnf install mosh -y
sudo dnf install neovim -y
sudo dnf install python3-neovim -y
sudo dnf install nmap -y
sudo dnf install pv -y
sudo dnf install readline -y
sudo dnf install sshuttle -y
sudo dnf install tig -y
sudo dnf install tmux -y
sudo dnf install tree -y
# Depreciated
# sudo dnf install youtube-dl -y
sudo dnf install wireguard-tools -y

# sudo dnf copr enable marcusmueller/sc-im # CLI spreadsheet tool
# sudo dnf --refresh install sc-im -y
sudo dnf install calcurse -y # Calendar

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
sudo dnf copr enable flatcap/neomutt -y
sudo dnf install neomutt -y
sudo dnf install isync msmtp pass -y
sudo dnf install lynx notmuch abook urlview -y
sudo dnf install pass-otp -y # not required but useful
sudo dnf install gvim -y

# RSS Reader
sudo dnf install newsboat -y

# Set up cron
sudo dnf install cronie -y
sudo systemctl start crond.service
sudo systemctl enable crond.service

## Librewolf
# Depreciated
# sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
# sudo dnf config-manager --add-repo https://rpm.librewolf.net
# sudo dnf install --refresh librewolf -y

# Install diff-so-fancy
cd ~/bin && git clone https://github.com/so-fancy/diff-so-fancy.git

# Install Flatpaks
flatpak install flathub org.signal.Signal -y
flatpak install flathub com.bitwarden.desktop -y

# DWM
# sudo dnf module enable dwm:latest
# sudo dnf module install dwm
# Log out and back in
# sudo dnf install dwm-user


# LF File 
sudo dnf copr enable pennbauman/ports -y
sudo dnf install lf -y

# Tailscale
sudo dnf config-manager --add-repo https://pkgs.tailscale.com/stable/fedora/tailscale.repo -y
sudo dnf install tailscale -y

sudo systemctl enable --now tailscaled
sudo tailscale up
tailscale ip -4
