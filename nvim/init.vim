if &compatible
  set nocompatible               " Be iMproved
endif

let mapleader = ','
let maplocalleader = ' '

function! s:source_rc(path)
    if has('nvim')
        let base_conf_dir = resolve(expand('~/.config/nvim/'))
    else
        let base_conf_dir = resolve(expand('~/.vim/'))
    endif

    execute 'source ' . base_conf_dir . '/' . a:path
endfunction

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

nnoremap <C-l> :<C-u>nohls<CR><C-l>
" call s:source_rc('rc/keymap.vim')

syntax on
colorscheme desert
