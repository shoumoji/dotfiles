set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set hlsearch
set ignorecase
set incsearch
set smartcase
set laststatus=2
set cursorline
set clipboard+=unnamedplus
set hls

" vimPlug
call plug#begin()
Plug 'tpope/vim-endwise'
Plug 'joshdick/onedark.vim'
colorscheme onedark
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
source ~/.config/nvim/plugins/gitgutter.vim
Plug 'tpope/vim-fugitive'
source ~/.config/nvim/plugins/fugitive.vim
Plug 'itchyny/lightline.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

filetype plugin indent on
syntax on

"インサートモードのままカーソル移動
inoremap <C-A> <Right>
inoremap <C-f><C-f> <ESC><S-a>

" Insert Mode jjでノーマルモードへ
inoremap <silent> jj <ESC>:<C-u>w<CR>
