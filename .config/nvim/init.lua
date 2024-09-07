vim.cmd([[
set wm=0
set tw=0
set nowrap

set showmatch
set hlsearch
set incsearch
set number
set mouse=a
set laststatus=2
set backspace=2

set modeline
set modelines=5
set foldlevel=5

set exrc
set secure

set wildmenu
set wildmode=list:longest,full

set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

set completeopt=menuone,noselect

set shortmess=filnxtToO

nnoremap j gj
nnoremap k gk
nnoremap <leader>w <C-w>
nnoremap <silent> <C-n> :nohl<CR>

vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <C-r><C-r> :e %<CR>
nnoremap <C-r><C-r><C-r> :e! %<CR>
]])

require("alternate-buffer")
require("backups")
require("folds")
require("tabs")
require("undo")

require("plugin-vim-plug")

require("lsp")
require("plugin-nvim-comment")
require("plugin-nvim-dap")
require("plugin-nvim-mason")
require("plugin-nvim-surround")
require("plugin-nvim-telescope")
require("plugin-nvim-treesitter")
require("plugin-nvim-trouble")
require("plugin-vim-ale")
require("plugin-vim-fugitive")
require("plugin-vim-lightline")
require("plugin-vim-session")
require("plugin-vim-smooth-scroll")
