#!/bin/bash

# Before running make sure you have logged into the Mac App store account

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Taps
brew tap gbataille/homebrew-gba
brew tap Goles/battery
brew tap browsh-org/homebrew-browsh
brew tap homebrew/cask-fonts
brew tap drud/ddev

brew install ansible
brew install bash
brew install bash-completion
brew install bat
brew install battery
brew install bitwarden-cli
brew install browsertime
brew install browsh
brew install blueutil
brew install cmake
brew install composer
brew install ctags
brew install ctags-better-php
brew install curl
brew install dark-mode
brew install ddev
brew install diff-so-fancy
brew install ddev
brew install dnsmasq
brew install fd
brew install ffmpeg
brew install flac
brew install flex
brew install fontconfig
brew install freetype
brew install fzf
brew install git-extras
brew install git-flow
brew install githud
brew install glib
brew install go
brew install graphviz
brew install gzip

# Added for my footswitch.
# Download and install https://github.com/rgerganov/footswitch
brew install hidapi
brew install htop
brew install htop-osx
brew install hub
brew install irssi
brew install jq
brew install mariadb
brew install mas
brew install mosh
brew install mp3splt
brew install nmap
brew install node
brew install peco
brew install php
brew install python
brew install pv
brew install readline
brew install reattach-to-user-namespace
brew install rename
brew install ssh-copy-id
brew install sshuttle
brew install testdisk
brew install the_silver_searcher
brew install tidy-html5
brew install tig
brew install tmux
brew install tmuxinator
brew install tree
brew install tuntap
brew install vim
brew install watch
brew install wget
brew install youtube-dl
brew install z

# Install homebrew Bash

sudo -s
echo /usr/local/bin/bash >> /etc/shells
chsh -s /usr/local/bin/bash

