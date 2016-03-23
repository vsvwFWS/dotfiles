" Cursor shape
if exists('$TMUX')
    let &t_ti = "\ePtmux;\e\e[1 q\e\\"
    let &t_SI = "\ePtmux;\e\e[5 q\e\\"
    let &t_SR = "\ePtmux;\e\e[3 q\e\\"
    let &t_EI = "\ePtmux;\e\e[1 q\e\\"
    let &t_te = "\ePtmux;\e\e[0 q\e\\"
else
    let &t_ti = "\e[1 q"
    let &t_SI = "\e[5 q"
    let &t_SR = "\e[3 q"
    let &t_EI = "\e[1 q"
    let &t_te = "\e[0 q"
endif

set history=10000
set hlsearch
