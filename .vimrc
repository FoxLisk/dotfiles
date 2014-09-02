set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

au GUIEnter * simalt ~x 

set diffexpr=MyDiff()
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set ignorecase
set smartcase
set foldmethod=indent
set ls=2
set wrap
set textwidth=80

highlight ColorColumn ctermbg=DarkGray
call matchadd('ColorColumn', '\%80v', 100)

exec "set listchars=trail:\uB7"
set list

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

function! Comment()
  s#^\(\s*\)#\1//#
endfunction

function! Uncomment()
  s#^\(\s*\)//#\1#
endfunction

function! PyComment()
  s/^\(\s*\)/\1#/
endfunction

function! PyUncomment()
  s/^\(\s*\)#/\1/
endfunction

function! ReplaceBraces(startBrace, endBrace)
  let @a=a:startBrace
  let @b=''
  let @c=a:endBrace
  normal "byibdab"ap"bp"cp
endfunction

function! EraseEndingWhitespace()
    %s/\s\+$//
endfunction

vmap <C-k> :call PyComment()<CR>
vmap <C-j> :call PyUncomment()<CR>

nmap <C-c> :call search("[A-Z]", "", line("."))<CR>
omap <C-c> :call search("[A-Z]", "", line("."))<CR>

nmap K <Nop>

colors elflord

map <F1> <Nop>
