"" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

set noswapfile " Disable swap files
set nobackup " Disable backups
set nowritebackup " Disable backups

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to <spacebar>
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac
set shortmess+=c

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on

set ruler
set numberwidth=1 " Size of row numbers

let no_buffers_menu=1

set mouse=a " Enables the mouse usage
set mousemodel=popup



"" Status bar
set laststatus=2

"" Use modeline overrides

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"" Search mappings: These will make it so that going to the next one in a
"" Search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Visual theme
let g:light_theme = 0

if (g:light_theme)
  colorscheme morning
else
  colorscheme elflord
endif



"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"" No one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Commands
"*****************************************************************************

"" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"" Undo
nmap <C-z> :undo<CR>
imap <C-z> <Esc>:undo<CR>a

"" Redo
nmap <C-y> :redo<CR>
imap <C-y> <Esc>:redo<CR>a

"" Disable vim's default undo and redo
map u <nop>
map <C-r> <nop>

"" Disable process suspension on Visual mode
vmap <C-z> <nop>

"" Save current buffer
nnoremap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

"" Save all open buffers
nnoremap <Leader>s :wa<CR>

"" Select all the buffer content
noremap <C-a> ggVG<CR>

"" Open split windows
noremap <silent> <Leader>sh :<C-u>split<CR>
noremap <silent> <Leader>sv :<C-u>vsplit<CR>

"" Disable visualbell
set noerrorbells visualbell t_vb=

"" Copy/Cut/Paste
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

inoremap jj <Esc>
colorscheme elflord



"" Include user's local vim config
if filereadable(expand("__VIMRC_LOCAL__"))
  source __VIMRC_LOCAL__
endif

