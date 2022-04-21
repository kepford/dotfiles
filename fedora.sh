# Maps capslock to escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
#Scale the text size up by 75%
gsettings set org.gnome.desktop.interface text-scaling-factor 1.75

# Disable Bluetooth power on boot.
# sudo vim /etc/tlp.conf
# DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"

# flatpak install flathub org.signal.Signal
# Build from source: https://zngguvnf.org/2018-02-25--building-signal-from-source.html
sudo dnf install libXScrnSaver
sudo dnf install gcc-c++
sudo dnf install git-lfs
git clone https://github.com/signalapp/Signal-Desktop.git ~/Applications/Signal-Desktop
cd Signal-Desktop
git checkout tags/v5.21.0
npm install yarn
yarn install
yarn generate
yarn build-release
# Start Signal
./release/linux-unpacked/signal-desktop
sudo ln -s ~/Applications/Signal-Desktop/release/linux-unpacked/signal-desktop /usr/local/bin/signal-desktop
sudo mkdir /usr/local/share/icons/
sudo cp ~/Applications/Signal-Desktop/images/icon_250.png /usr/local/share/icons/signal.png

sudo dnf install gnome-tweak-tool
# Settings in Firefox: https://extensions.gnome.org/local/

# Syncthing #
dnf install syncthing
# Start and enable on boot.
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

#Power management
sudo dnf install powertop
sudo powertop --auto-tune
sudo systemctl enable powertop

sudo dnf install tlp tlp-rdw
sudo systemctl enable tlp

# My coding fonts
sudo dnf install fira-code-fonts

# Required for YouCompleteMe Vim plugin.
sudo dnf install cmake gcc-c++ make python3-devel

# sudo vim /etc/tlp.conf
# Add this config
# PCIE_ASPM_ON_BAT=powersupersave

# GPU rendering with Firefox
sudo dnf install igt-gpu-tools
# Ensure that intel_gpu_top is showing GPU usage when watching video on browser.
# Firefox 92 → about:config → layers.acceleration.force-enabled

# HTML Tidy
sudo dnf install tidy

sudo dnf install php
sudo dnf install composer
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

sudo dnf install the_silver_searcher

# Clipboard support for Tmux and Vim
dnf install xclip # Need to run `hostname | xclip -sel c`

# Docker #
# https://docs.docker.com/engine/install/fedora/

# Ddev #
# sudo apt install build-essential apt-transport-https ca-certificates software-properties-common curl
# curl -O https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh
# chmod +x install_ddev.sh
# ./install_ddev.sh

sudo dnf install gvim
sudo dnf install fzf

# git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

sudo dnf install bash-completion
sudo dnf install bat
sudo dnf install cmake
sudo dnf install ctags
sudo dnf install ffmpeg

# sudo dnf install flex
# sudo dnf install fontconfig
# sudo dnf install freetype
# sudo dnf install glib
# sudo dnf install go

# Added for my footswitch.
# Download and install https://github.com/rgerganov/footswitch
# brew install hidapi

sudo dnf install htop
sudo dnf install jq
sudo dnf install mosh
sudo dnf install neovim
sudo dnf install nmap
sudo dnf install pv
sudo dnf install ranger
sudo dnf install readline
sudo dnf install sshuttle
sudo dnf install testdisk
sudo dnf install tidy
sudo dnf install tig
sudo dnf install tmux
sudo dnf install tree
sudo dnf install youtube-dl
sudo dnf install wireguard-tools
