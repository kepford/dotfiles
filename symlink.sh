#!/bin/bash

# Git
# Symlink the following files/directories to the dotfiles directory.

ln -s ~/bin/dotfiles/git/.git_template ~/.git_template
ln -s ~/bin/dotfiles/git/.gitconfig ~/.gitconfig
touch ~/.gitconfig_local
ln -s ~/bin/dotfiles/git/.gitignore ~/.gitignore
ln -s ~/bin/dotfiles/git/.gitmessage ~/.gitmessage
ln -s ~/bin/dotfiles/git/git-completion.bash ~/git-completion.bash
ln -s ~/bin/dotfiles/git/git-flow-completion.bash ~/git-flow-completion.bash

# Vim
# Symlink the following files/directories to the dotfiles directory.

ln -s  ~/bin/dotfiles/vim/gvimrc ~/.gvimrc
ln -s ~/bin/dotfiles/vim ~/.vim
ln -s ~/bin/dotfiles/vim/vimrc ~/.vimrc

#Tmux
# Symlink the following files/directories to the dotfiles directory.

ln -s ~/bin/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Drupal Console
# Symlink the following files/directories to the dotfiles directory.

ln -s ~/bin/dotfiles/drupal_console ~/.console

# Karabiner
if [[ $OSTYPE == 'darwin'* ]]; then
	ln -s ~/bin/dotfiles/karabiner ~/.config/karabiner
fi

# Hammerspoon
if [[ $OSTYPE == 'darwin'* ]]; then
	ln -s ~/bin/dotfiles/hammerspoon ~/.hammerspoon
fi

echo "Finished symlinkng for dotfiles"
