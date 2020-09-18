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
brew install resty
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

# Cask
brew cask install alfred
# brew cask install arq
brew cask install audio-hijack
brew cask install bartender
brew cask install bettertouchtool
brew cask install bitwarden
brew cask install controlplane
brew cask install dash
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install font-fira-code
brew cask install google-chrome
brew cask install google-drive
brew cask install hammerspoon
brew cask install imagealpha
brew cask install imageoptim
brew cask install iterm2
brew cask install ithoughtsx
brew cask install hazel
brew cask install jumpcut
brew cask install karabiner-elements
brew cask install keycastr
brew cask install licecap
brew cask install loopback
brew cask install mailmate
brew cask install marked
brew cask install mindnode-pro
brew cask install mousepose
brew cask install ngrok
brew cask install onyx
brew cask install screenflow
brew cask install sequel-pro
brew cask install slack
brew cask install soundsource
brew cask install soulver
brew cask install superduper
brew cask install transmission
brew cask install tripmode
brew cask install tunnelblick
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install vlc
brew cask install xscope

# Quicklook plugins

brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install webpquicklook
brew cask install suspicious-package

# Remove outdated versions from the cellar
brew cleanup

# Install Mac App store apps.
mas install 411643860  # DaisyDisk (4.3.2)
mas install 497799835  # Xcode (8.2.1)
mas install 445189367  # PopClip (1.5.6)
mas install 944654199  # Tree 2 (2.0.3)
mas install 937984704  # Amphetamine
mas install 540348655  # Monosnap (3.3.0)
mas install 408981434  # iMovie (10.1.4)
mas install 409183694  # Keynote (7.0.5)
mas install 588726889  # ReadKit (2.5.1)
mas install 975937182  # Fantastical 2 (2.3.3)
mas install 1017470484 # Next Meeting (1.9)
mas install 671736912  # FruitJuice (2.3.2)
mas install 1346203938 # OmniFocus (3.4.6)
mas install 409201541  # Pages (6.0.5)
mas install 682658836  # GarageBand (10.1.4)
mas install 417375580  # BetterSnapTool (1.7)
mas install 847496013  # Deckset (1.6.3)
mas install 409203825  # Numbers (4.0.5)
mas install 609313570  # PDFpenPro 6 (6.3.2)
mas install 413965349  # Soulver
mas install 405904955  # Mouseposé (3.2.7)
mas install 1319778037 # iStat Menus (6.41)
mas install 441258766  # Magnet (2.4.5)
mas install 695406827  # Dropzone 3 (3.7.0)
mas install 1346203938 # OmniFocus (3.4.6)
mas install 1055511498 # Day One (4.4)

# Other Apps that have to be installed manually.
# Little Snitch
