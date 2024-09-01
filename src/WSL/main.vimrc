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
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"" Set number
set nu
set relativenumber

set termguicolors
set scrolloff=8

"" Map leader to <spacebar>
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set nohlsearch
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


"" Disable visualbell
set noerrorbells visualbell t_vb=

"" Copy/Cut/Paste
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
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
autocmd BufWritePre * %s/\s\+$//e

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

"*****************************************************************************
" Keymaps
"*****************************************************************************

"" Disable process suspension on Visual mode
vmap <C-z> <nop>

"" Select all the buffer content
noremap <C-a> ggVG<CR>


inoremap jj <Esc>

" Better window navigation
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h

" Window resize
nnoremap <C-Right> :vertical resize +2 <CR>
nnoremap <C-Left> :vertical resize -2 <CR>
nnoremap <C-Down> :resize +2 <CR>
nnoremap <C-Up> :resize -2 <CR>

" Move text up down
nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" Update indentation
vnoremap < <gv
vnoremap > >gv

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************

"" Required:
call plug#begin(expand('~/.vim/plugged'))


"*****************************************************************************
"" Plug install packages
"*****************************************************************************

    Plug 'ayu-theme/ayu-vim' " or other package manager
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdcommenter'
    Plug 'ryanoasis/vim-devicons'
    if isdirectory('/usr/local/opt/fzf')
      Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    else
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
      Plug 'junegunn/fzf.vim'
    endif
    let g:make = 'gmake'
    if exists('make')
            let g:make = 'make'
    endif

call plug#end()
"*****************************************************************************

"*****************************************************************************

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Find<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

if (g:light_theme)
    colorscheme morning
else
    colorscheme ayu
endif
let g:airline_theme='ayu'

"" Include user's local vim config
if filereadable(expand("__VIMRC_LOCAL__"))
  source __VIMRC_LOCAL__
endif
