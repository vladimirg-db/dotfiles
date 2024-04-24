vim.cmd([[
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'folke/trouble.nvim'
Plug 'google/vim-jsonnet'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scalameta/nvim-metals'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

call plug#end()
]])
