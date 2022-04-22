
# sudo nano /etc/dnf/dnf.conf
# fastestmirror=True
# max_parallel_downloads=10
# defaultyes=True

# run updates `sudo dnf update`

# Enabling the RPM Fusion repositories
# https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/

# Enables free repository
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

# Enables non-free repository
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Installing plugins for playing movies and music
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/ 

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y

# install vim
sudo dnf install vim -y
sudo dnf install neofetch -y

# Maps capslock to escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Scale the text size up by 75%
# gsettings set org.gnome.desktop.interface text-scaling-factor 1.75

# Disable Bluetooth power on boot.
# sudo vim /etc/tlp.conf
# DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"

# Signal
# flatpak install flathub org.signal.Signal

# Build from source: https://zngguvnf.org/2018-02-25--building-signal-from-source.html
# sudo dnf install libXScrnSaver
# sudo dnf install gcc-c++
# sudo dnf install git-lfs
# git clone https://github.com/signalapp/Signal-Desktop.git ~/Applications/Signal-Desktop
# cd Signal-Desktop
# git checkout tags/v5.21.0
# npm install yarn
# yarn install
# yarn generate
# yarn build-release
# # Start Signal
# ./release/linux-unpacked/signal-desktop
# sudo ln -s ~/Applications/Signal-Desktop/release/linux-unpacked/signal-desktop /usr/local/bin/signal-desktop
# sudo mkdir /usr/local/share/icons/
# sudo cp ~/Applications/Signal-Desktop/images/icon_250.png /usr/local/share/icons/signal.png

# sudo dnf install gnome-tweak-tool
# Settings in Firefox: https://extensions.gnome.org/local/

# Syncthing #
dnf install syncthing -

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
sudo dnf install cmake gcc-c++ make python3-devel -y

# GPU rendering with Firefox
sudo dnf install igt-gpu-tools -y
# Ensure that intel_gpu_top is showing GPU usage when watching video on browser.
# Firefox 92 → about:config → layers.acceleration.force-enabled

sudo dnf install tidy -y
sudo dnf install php  -y
sudo dnf install composer -y

# Install coder for phpcs
composer global require drupal/coder
composer global require drupal/coder dealerdirect/phpcodesniffer-composer-installer
phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer

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

sudo dnf install the_silver_searcher -y

# Clipboard support for Tmux and Vim
dnf install xclip -y # Need to run `hostname | xclip -sel c`

# Docker #
# https://docs.docker.com/engine/install/fedora/

# Ddev #
# sudo apt install build-essential apt-transport-https ca-certificates software-properties-common curl
# curl -O https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh
# chmod +x install_ddev.sh
# ./install_ddev.sh

sudo dnf install gvim -y
sudo dnf install fzf -y

# git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

sudo dnf install bash-completion -y
sudo dnf install bat -y
sudo dnf install cmake -y
sudo dnf install ctags -y
sudo dnf install ffmpeg -y
# sudo dnf install flex -y
# sudo dnf install fontconfig -y
# sudo dnf install freetype -y
# sudo dnf install glib -y
# sudo dnf install go -y

# Added for my footswitch.
# Download and install https://github.com/rgerganov/footswitch
# brew install hidapi

sudo dnf install htop -y
sudo dnf install jq -y
sudo dnf install mosh -y
sudo dnf install neovim -y
sudo dnf install nmap -y
sudo dnf install pv -y
sudo dnf install ranger -y
sudo dnf install readline -y
sudo dnf install sshuttle -y
sudo dnf install tig -y
sudo dnf install tmux -y
sudo dnf install tree -y
sudo dnf install youtube-dl -y
sudo dnf install wireguard-tools -y
