command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('tpope/vim-repeat') "Required by easyclip
call minpac#add('svermeulen/vim-easyclip') "Simplified clipboard functionality for Vim.
call minpac#add('rking/ag.vim') " a front for ag, A.K.A. the_silver_searcher
call minpac#add('junegunn/limelight.vim')

" File management
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-vinegar') " Combine with netrw to create a delicious salad dressing.
call minpac#add('pbrisbin/vim-mkdir') "Automatically create any non-existent directories before writing the buffer

" Git
call minpac#add('tpope/vim-fugitive') "the ultimate git helper
call minpac#add('airblade/vim-gitgutter') "shows a git diff in the gutter
call minpac#add('christoomey/vim-conflicted') "Easy git merge conflict resolution in Vim

" Code management
call minpac#add('tpope/vim-commentary') " comment/uncomment lines with gcc or gc in visual mode
call minpac#add('Valloric/YouCompleteMe')
call minpac#add('w0rp/ale') "ALE (Asynchronous Lint Engine)
call minpac#add('majutsushi/tagbar')
call minpac#add('xolox/vim-misc') "Required by easytags.
call minpac#add('xolox/vim-easytags') "Automated tag file generation and syntax highlighting of tags
call minpac#add('AndrewRadev/splitjoin.vim') "Transition between multiline and single-line code.
call minpac#add('jiangmiao/auto-pairs') "Insert or delete brackets, parens, quotes in pair.
call minpac#add('chrisbra/csv.vim') " A Filetype plugin for csv files.

" Tmux
call minpac#add('christoomey/vim-tmux-navigator') "https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits

" Airline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Syntax highlighting.
call minpac#add('lumiliet/vim-twig') " Twig syntax highlighting.
call minpac#add('elzr/vim-json') " JSON code highlighting.

" Snipmate
call minpac#add('MarcWeber/vim-addon-mw-utils')" Required by vim-snipmate
call minpac#add('tomtom/tlib_vim') " Required by vim-snipmate
call minpac#add('garbas/vim-snipmate')
call minpac#add('honza/vim-snippets') " Snippets for snipmate

" Misc
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-surround')" surround text with things
call minpac#add('tpope/vim-dispatch') " Run commands in the background.
call minpac#add('tpope/vim-speeddating') " use CTRL-A/CTRL-X to increment dates, times, and more.
call minpac#add('tpope/vim-rsi') " Readline style insertion.
call minpac#add('benmills/vimux')
call minpac#add('rizzatti/dash.vim') "Dash.app support
call minpac#add('szw/vim-g') "Google from vim by selecting a word
call minpac#add('sjl/gundo.vim') " Visualize your Vim undo tree.
call minpac#add('mattn/webapi-vim')
call minpac#add('mattn/gist-vim')
call minpac#add('terryma/vim-smooth-scroll') "Smooths the scrolling in Vim
call minpac#add('christoomey/vim-titlecase')
call minpac#add('polm/github-tasks.vim') "This plugin adds support for Github tasks, letting you turn normal markdown list entries into tasks and toggle them done or not done.
call minpac#add('tommcdo/vim-exchange') "Easy text exchange operator
call minpac#add('lifepillar/vim-solarized8') " My current colorscheme.
call minpac#add('wincent/terminus') " Enhanced terminal integration for Vim. Allows Vim to receive FocusGained and FocusLost events, even in the terminal and inside tmux.
call minpac#add('tpope/vim-eunuch') " Vim sugar for UNIX shell commands that need it the most.

" Javascript
call minpac#add('pangloss/vim-javascript')
call minpac#add('tpope/vim-jdaddy') "JSON manipulation and pretty printing
call minpac#add('mxw/vim-jsx') " React JSX syntax highlighting and indenting for vim.
call minpac#add('mattn/emmet-vim') " emmet for vim
call minpac#add('ternjs/tern_for_vim')

" Markdown
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-markdown')
call minpac#add('nelstrom/vim-markdown-folding')
call minpac#add('itspriddle/vim-marked')
call minpac#add('davidoc/taskpaper.vim')
call minpac#add('dhruvasagar/vim-table-mode')

" PHP and Drupal
" Plugin 'arnaud-lb/vim-php-namespace' "types PHP use statements for you
call minpac#add('shawncplus/phpcomplete.vim')
call minpac#add('mkusher/padawan.vim')
call minpac#add('joonty/vdebug')