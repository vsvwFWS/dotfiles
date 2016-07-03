if &compatible
  set nocompatible               " Vi IMproved
endif

nnoremap <silent> , <Nop>
let mapleader = ','
let maplocalleader = ' '
nnoremap <silent> \ ,

function! s:source_rc(path)
    if has('nvim')
        let base_conf_dir = resolve(expand('~/.config/nvim/'))
    else
        let base_conf_dir = resolve(expand('~/.vim/'))
    endif

    execute 'source ' . base_conf_dir . '/' . a:path
endfunction

" Set augroup.
" 一箇所でまとめて定義できない autocmd のグループを定義
augroup MyAutoCmd
  autocmd!
augroup END

"Start dein Scripts-----------------------------
call s:source_rc('rc/dein.rc.vim')

if has('nvim')
    call s:source_rc('rc/nvim.rc.vim')
else
    call s:source_rc('rc/vim.rc.vim')
endif

" If you want to install not installed plugins on startup.
if has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif

"End dein Scripts-------------------------

" Basic settings
set number
set hidden

set virtualedit=block
set nobackup
" set backupdir=~/.cache/vim_bk

" Indentation settings
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Search settings
set ignorecase
set smartcase

set list
set listchars=tab:>-,trail:_,extends:>,precedes:<

set nowildmenu
set wildmode=list:longest,full

" Use Ag for :grep command
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
" set noswapfile

" settings of plugins which are not managed by plugin manager.
let g:Gtags_Auto_Map = 1

" key mappings
nnoremap <silent> <C-l> :<C-u>nohls<CR><C-l>
nnoremap <Leader>g :<C-u>Gtags
nnoremap <C-p> :<C-u>cN<CR>
nnoremap <C-n> :<C-u>cn<CR>
" call s:source_rc('rc/keymap.vim')

" syntax on
syntax enable
colorscheme desert
" set background=dark
" colorscheme hybrid
" colorscheme solarized
