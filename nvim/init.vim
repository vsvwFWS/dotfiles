"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
" call dein#add('Shougo/vimshell') " Requires vimproc
"
" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" Set parameters of dein plugins
let g:deoplete#enable_at_startup=1

"End dein Scripts-------------------------

" Basic settings
set number
set hidden

" NeoVim parameters
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
if $TERM !~ 'rxvt'
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Indentation settings
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Search settings
set ignorecase
set smartcase

set wildmode=list:longest,full

syntax on
colorscheme desert
