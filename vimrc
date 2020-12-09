set nocompatible
syntax on
set shortmess+=I
set wrap
set number
set noerrorbells visualbell t_vb=
set ignorecase
set smartcase
set backspace=indent,eol,start
set laststatus=2
set autoindent
set tabstop=2
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
inoremap jj <Esc>
