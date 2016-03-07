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
