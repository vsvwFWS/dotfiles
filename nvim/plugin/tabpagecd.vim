function! s:tabPageEnter()
  if exists('t:current_working_dir')
    exe 'cd' fnameescape(t:current_working_dir)
  endif
endfunction

function! s:tabPageLeave()
  let t:current_working_dir = getcwd()
endfunction


augroup tabpagecwd
  autocmd!
  autocmd TabEnter * call <SID>tabPageEnter()
  autocmd TabLeave * call <SID>tabPageLeave()
augroup END


