# .Dot files

## Features

* Homebrew
* Bash
* Vim
* Git
* Drupal
* Tmux
* osx

## Installation

### Fonts

[FiraCodeNerdFont](https://www.nerdfonts.com/font-downloads)

Download the font

Move fonts to `/usr/share/fonts/`

Refresh the system font cache with fc-cache, e.g.:

`fc-cache -v`

### Homebrew

Install [Homebrew](http://brew.sh/)

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`


### Symlinks and home directory

**Bash**

On different systems you may have a `.bash_profile`, `.bashrc` and `.profile` files. We need to direct configuration to our dotfiles directory. Edit your files to include the following.

**.bash_profile**

```
if [ -f ~/.bashrc ];
then
    source ~/.bashrc
    fi
```

**.bashrc**

```
. ~/bin/dotfiles/bashrc
```

**.profile**

```
. ~/.bashrc
```

**Enabling Italics in Vim and tmux**

```
 tic ~/bin/dotfiles/terminfo/xterm-256color-italic.terminfo
 tic ~/bin/dotfiles/terminfo/screen-256color-italic.terminfo
 tic ~/bin/dotfiles/terminfo/tmux.terminfo
```

Open iTerm2 and go to Profiles > Terminal and set Report terminal type as xterm-256color-italic

Kill tmux and restart iTerm

**Git**

Symlink the following files/directories to the dotfiles directory.

```
ln -s ~/bin/dotfiles/git/.git_template ~/.git_template
ln -s ~/bin/dotfiles/git/.gitconfig ~/.gitconfig
touch ~/.gitconfig_local
ln -s ~/bin/dotfiles/git/.gitignore ~/.gitignore
ln -s ~/bin/dotfiles/git/git-completion.bash ~/git-completion.bash
ln -s ~/bin/dotfiles/git/git-flow-completion.bash ~/git-flow-completion.bash
```

**Vim**

Symlink the following files/directories to the dotfiles directory.

```
ln -s  ~/bin/dotfiles/vim/gvimrc ~/.gvimrc
ln -s ~/bin/dotfiles/vim ~/.vim
ln -s ~/bin/dotfiles/vim/vimrc ~/.vimrc
```

**Tmux**

Symlink the following files/directories to the dotfiles directory.

```
ln -s ~/bin/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/bin/dotfiles/tmux ~/.tmux
```

Install Tmux plugin manager (tpm)

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

* If you are in Tmux exit and kill the server.
* Launch Tmux
* Press `prefix + I` (capital i, as in Install) to fetch the plugins.
* `prefix + U` updates plugins

**Drupal Console**

Symlink the following files/directories to the dotfiles directory.

```
ln -s ~/bin/dotfiles/drupal_console ~/.console
```

**Node**

* [Install nvm](https://github.com/nvm-sh/nvm)
* Install node and nvm

**PHP**

[Install Composer](https://getcomposer.org/)
