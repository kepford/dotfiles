" Install plug if not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'tpope/vim-repeat' "Required by easyclip
Plug 'svermeulen/vim-easyclip' "Simplified clipboard functionality for Vim.
Plug 'rking/ag.vim' " a front for ag, A.K.A. the_silver_searcher
Plug 'junegunn/limelight.vim'
Plug 'wincent/loupe' " Enhances search in Vim.

" File management
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar' " Combine with netrw to create a delicious salad dressing.
Plug 'pbrisbin/vim-mkdir' "Automatically create any non-existent directories before writing the buffer
Plug '907th/vim-auto-save' " Automatically save changes to disk in Vim

" Git
Plug 'tpope/vim-fugitive' "the ultimate git helper
Plug 'airblade/vim-gitgutter' "shows a git diff in the gutter
Plug 'christoomey/vim-conflicted' "Easy git merge conflict resolution in Vim
Plug 'junegunn/gv.vim' "A git commit browser

" Code management
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'w0rp/ale' "ALE (Asynchronous Lint Engine)
Plug 'majutsushi/tagbar'
Plug 'AndrewRadev/splitjoin.vim' "Transition between multiline and single-line code.
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.

" Tmux
Plug 'christoomey/vim-tmux-navigator' "https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plug 'tmux-plugins/vim-tmux' "Plugin for tmux.conf.

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax highlighting.
Plug 'lumiliet/vim-twig' " Twig syntax highlighting.
Plug 'elzr/vim-json' " JSON code highlighting.

" Snipmate
Plug 'SirVer/ultisnips' " Snippets for Vim.
Plug 'honza/vim-snippets' " Snippets for snipmate

" Color Schemes
Plug 'lifepillar/vim-solarized8' " My current colorscheme.
" Plug 'kepford/cobalt2.vim', {'as': 'cobalt2'} " My verion of the Wes Bos clone of Cobalt2.
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'j-tom/vim-old-hope' " Vim port of old hope theme.
Plug 'herrbischoff/cobalt2.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Misc
Plug 'tpope/vim-abolish' " Abbreviation and substitution helpers
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround' " surround text with things
Plug 'tpope/vim-dispatch' " Run commands in the background.
Plug 'tpope/vim-speeddating' " use CTRL-A/CTRL-X to increment dates, times, and more.
Plug 'tpope/vim-rsi' " Readline style insertion.
Plug 'benmills/vimux'
Plug 'rizzatti/dash.vim' "Dash.app support
Plug 'szw/vim-g' "Google from vim by selecting a word
Plug 'sjl/gundo.vim' " Visualize your Vim undo tree.
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'christoomey/vim-titlecase'
Plug 'polm/github-tasks.vim' "This plugin adds support for Github tasks, letting you turn normal markdown list entries into tasks and toggle them done or not done.
Plug 'tommcdo/vim-exchange' "Easy text exchange operator
Plug 'inkarkat/SyntaxAttr.vim' " Show syntax highlighting attributes of character under cursor.
Plug 'wincent/terminus' " Enhanced terminal integration for Vim. Allows Vim to receive FocusGained and FocusLost events, even in the terminal and inside tmux.
Plug 'tpope/vim-eunuch' " Vim sugar for UNIX shell commands that need it the most.
Plug 'ap/vim-css-color' " Preview colours in source code while editing.
Plug 'machakann/vim-highlightedyank' "Make the yanked region apparent
Plug 'christoomey/vim-sort-motion' "Makes sort better
Plug 'dkarter/bullets.vim' " Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
Plug 'mhinz/vim-startify' "Start page for Vim
Plug 'biosugar0/vim-popyank' "Yank popup window text.

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-jdaddy' "JSON manipulation and pretty printing
Plug 'MaxMEllon/vim-jsx-pretty' " React JSX syntax highlighting and indenting for vim.
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'leafgarland/typescript-vim' " Typescript syntax for Vim.
Plug 'peitalin/vim-jsx-typescript' " Syntax highlighting for JSX in Typescript.
Plug 'styled-components/vim-styled-components' " Support for styled components.

" GraphQL
Plug 'jparise/vim-graphql'

" " Markdown
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'itspriddle/vim-marked'
Plug 'davidoc/taskpaper.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

" " PHP and Drupal
Plug ('vim-vdebug/vdebug')
Plug ('shawncplus/phpcomplete.vim')
Plug 'https://git.drupalcode.org/project/vimrc.git', { 'branch': '8.x-1.x', 'rtp': 'bundle/vim-plugin-for-drupal' }


" Initialize plugin system
call plug#end()
