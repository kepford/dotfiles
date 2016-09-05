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

**Git**

Symlink the following files/directories to the dotfiles directory.

```
.git_template -> bin/dotfiles/git/.git_template
.gitconfig -> /Users/yourusername/bin/dotfiles/git/.gitconfig
.gitconfig_local
.gitignore -> /Users/yourusername/bin/dotfiles/git/.gitignore
git-completion.bash -> /Users/yourusername/bin/dotfiles/git/git-completion.bash
git-flow-completion.bash -> /Users/yourusername/bin/dotfiles/git/git-flow-completion.bash
```

**Vim**

Symlink the following files/directories to the dotfiles directory.

```
.gvimrc -> /Users/yourusername/bin/dotfiles/vim/gvimrc
.vim -> /Users/yourusername/bin/dotfiles/vim
.vimrc -> /Users/yourusername/bin/dotfiles/vim/vimrc
```

**Tmux**

Symlink the following files/directories to the dotfiles directory.

```
.tmux.conf -> /Users/yourusername/bin/dotfiles/tmux/tmux.conf
```

**Drupal Console**

Symlink the following files/directories to the dotfiles directory.

```
.console -> /Users/yourusername/bin/dotfiles/drupal_console
```
