colorscheme desert

set number
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent
set showmatch
set ruler
set incsearch
set virtualedit=all 
set nowrap
set ignorecase
set hlsearch
set autochdir

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" press jk as escape
inoremap jk <Esc>

map // :/\s\+$//
imap <C-e> <esc>A
imap <C-a> <esc>I
imap ;; <Esc>
nmap <Space> :noh<CR>


let mapleader = ","
let scrolloff=15

" change current directory to current filepath "
map <leader>cd :cd %:p:h<CR>

" begin resig vim
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
set nocompatible
set autoindent
set tabstop=2
set showmatch
set vb t_vb=
set ruler

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

"in vimrc:
"python extensions
"py from vim import buffers, windows, command, current, error
"py import vim, sys
"py from vimpy import *

command! PyExecBuffer py exec('\n'.join(current.buffer))

map <F5> :PyExecBuffer<CR>
imap <F5> <Esc><F5><CR>a

"make vimdiff prettier
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white 
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black 
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black 
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
