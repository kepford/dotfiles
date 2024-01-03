-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Formatting
  use("stevearc/conform.nvim")

  -- Linting
  use("mfussenegger/nvim-lint")

  -- Themes/Color
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,}
  -- use('nvim-treesitter/playground')
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  -- use("mbbill/undotree")
  -- use('tpope/vim-fugitive')
  -- use('airblade/vim-gitgutter') -- shows a git diff in the gutter
  -- use('nvim-treesitter/nvim-treesitter-context')
  -- use('tpope/vim-commentary') -- comment/uncomment lines with gcc or gc in visual mode
  -- Consider removing
  -- use('tpope/vim-rsi') -- Readline style insertion.
  -- Improvements to netrw. Use it for - open on current file
  -- use('tpope/vim-vinegar') 
  -- use('tpope/vim-eunuch') -- Vim sugar for UNIX shell commands that need it the most.
  -- use('wincent/loupe') -- " Enhances search in Vim.
  -- End consider removing

  -- use('machakann/vim-highlightedyank') -- Make the yanked region apparent
  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }

  -- Tmux
  -- use('christoomey/vim-tmux-navigator'); -- "https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits

  -- Markdown
  -- use('polm/github-tasks.vim'); -- "This plugin adds support for Github tasks, letting you turn normal markdown list entries into tasks and toggle them done or not done.
  -- use('dkarter/bullets.vim');  -- Bullets.vim is a Vim/NeoVim plugin for automated bullet lists.
  -- Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

--  use('tpope/vim-repeat'); -- Required by easyclip
-- use('tpope/vim-unimpaired');
  -- use('tpope/vim-surround'); -- surround text with things
  -- use('pbrisbin/vim-mkdir'); -- Automatically create any non-existent directories before writing the buffer

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

end)
