let $CACHE = expand('~/.cache')

if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif

let s:dein_dir = expand('$CACHE/dein') . '/repos/github.com/Shougo/dein.vim'
let s:path = expand('$CACHE/dein')

if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif

" Required:
set runtimepath^=~/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim

execute ' set runtimepath^=' . s:dein_dir

" Required:
call dein#begin(s:path)

" Let dein manage dein
" Required:
" 同期読込
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
            \ 'build': {
            \     'windows': 'tools\\update-dll-mingw',
            \     'cygwin': 'make -f make_cygwin.mak',
            \     'mac': 'make -f make_mac.mak',
            \     'linux': 'make',
            \     'unix': 'gmake',
            \    },
            \ })
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/context_filetype.vim')

" 非同期読込
call dein#add('Shougo/neosnippet.vim', {
            \ 'depends': ['neosnippet-snippets', 'context_filetype.vim'],
            \ 'on_i' : 1,
            \ 'on_ft': ['snippet']
            \ })
call dein#add('Shougo/deoplete.nvim', {
            \ 'depends': ['context_filetype.vim'],
            \ 'on_i': 1
            \ })
call dein#add('tpope/vim-surround',{
            \ 'on_i': 1 
            \ })

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
" call dein#add('Shougo/vimshell') " Requires vimproc
"
" Required:
call dein#end()

if has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
"
" Required:
filetype plugin indent on

" 各種プラグイン設定
if dein#tap('deoplete.nvim') && has('nvim') "{{{
  let g:loaded_neocomplete = 1
  let g:deoplete#enable_at_startup = 1
endif "}}}

if dein#tap('neocomplete.vim') && has('lua') "{{{
  let g:loaded_deoplete = 1
  let g:neocomplete#enable_at_startup = 1
endif "}}}
