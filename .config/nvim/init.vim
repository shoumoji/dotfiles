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
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
" LSP関連
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" goの自動整形
Plug 'mattn/vim-goimports'
" LSP関連終了
call plug#end()

filetype plugin indent on
syntax enable
colorscheme onedark

" asyncompleteのTab補完
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

"vimLSP関連の設定
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
" エラー表示を無効に
let g:lsp_virtual_text_enabled = 0

" 保存時にLSPの自動整形
autocmd BufWritePre <buffer> LspDocumentFormatSync

" Makefileではtab文字を使う
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=4

" Insert Mode jjでノーマルモードへ
inoremap <silent> jj <ESC>:<C-u>w<CR>

" vsnipの移動
" Jump forward or backward
imap <expr> <C-n> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
smap <expr> <C-n> vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
imap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'
smap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'

" texの自動ビルド
augroup auto_tex_build
  autocmd!
  autocmd FileType tex
    \ autocmd BufWritePost <buffer> LspDocumentBuild
augroup END
