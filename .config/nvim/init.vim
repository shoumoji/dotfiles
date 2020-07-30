set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard+=unnamedplus
set hls
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" vim-goのバージョン警告を無視
let g:go_version_warning = 0
"==========
"dein.vim
"==========
if &compatible
  set nocompatible
endif
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

"インサートモードのままカーソル移動
inoremap <C-A> <Right>
inoremap <C-f><C-f> <ESC><S-a>

"閉じカッコ補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" Insert Mode jjでノーマルモードへ
inoremap <silent> jj <ESC>:<C-u>w<CR>
