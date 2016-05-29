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
" プラグイン管理・ユーティリティ
call dein#add('Shougo/dein.vim')

call dein#add('Shougo/vimproc.vim', {
            \ 'build': 'make',
            \ })

call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim', {
            \ 'depends': ['neomru.vim']
            \ })

call dein#add('Shougo/vimfiler.vim', {
            \ 'depends': ['unite.vim'],
            \ 'on_path': '.*',
            \ })

" テキストオブジェクト、オペレーター
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-operator-user')

call dein#add('kana/vim-textobj-indent', {
            \ 'depends': 'vim-textobj-user',
            \ })
" 編集補助
call dein#add('tpope/vim-surround', {
            \ 'on_path': '.*',
            \ })
call dein#add('mattn/emmet-vim', {
            \ 'on_i': 1,
            \ })
call dein#add('Shougo/neosnippet.vim', {
            \ 'depends': ['neosnippet-snippets', 'context_filetype.vim'],
            \ 'on_i' : 1,
            \ 'on_ft': ['snippet'],
            \ })
call dein#add('Shougo/deoplete.nvim', {
            \ 'depends': ['context_filetype.vim'],
            \ 'if': "has('nvim')",
            \ 'on_i': 1,
            \ })
call dein#add('Shougo/neocomplete.vim', {
            \ 'depends': 'context_filetype.vim',
            \ 'if': "has('lua')",
            \ 'on_i': 1,
            \})

" テキスト整形
" call dein#add('h1mesuke/vim-alignta', { \ })
call dein#add('junegunn/vim-easy-align')
" バイナリ編集
call dein#add('Shougo/vinarise.vim')

" カラースキーム
call dein#add('w0ng/vim-hybrid')
call dein#add('altercation/vim-colors-solarized')

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
if dein#tap('unite.vim')
    "call unite#custom#profile('default', 'context', {
    "            \   'start_insert': 1,
    "            \   'winheight': 10,
    "            \   'direction': 'botright',
    "            \ })
    nmap <Leader>u [unite]
    nnoremap <silent> [unite]s :<C-u>Unite source<CR>
    nnoremap <silent> [unite]m :<C-u>Unite neomru/file neomru/directory<CR>
    nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
    nnoremap <silent> [unite]f :<C-u>Unite file/async file_rec/neovim<CR>
    nnoremap <silent> [unite]k :<C-u>Unite mapping<CR>
    nnoremap [unite]u :<C-u>Unite<Space>
endif

if dein#tap('deoplete.nvim') && has('nvim') "{{{
    let g:loaded_neocomplete = 1
    let g:deoplete#enable_at_startup = 1
endif "}}}

if dein#tap('neocomplete.vim') && has('lua') "{{{
    let g:loaded_deoplete = 1
    let g:neocomplete#enable_at_startup = 1
endif "}}}

if dein#tap('emmet-vim')
    let g:user_emmet_install_global = 0
    let g:user_emmet_settings = {
                \    'variables' : {
                \        'lang' : 'ja',
                \    }
                \ }
    " let g:user_emmet_leader_key = '<C-y>'  " Default key
    autocmd MyAutoCmd FileType html,css EmmetInstall
endif

if dein#tap('vim-easy-align')
    " Start interactive EasyAlign.
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
endif
