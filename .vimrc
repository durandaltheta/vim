"NERDTree
"ctags
"EasyMotion
"NERDCommenter
"SimpylFold
"IndentPython
"YouCompleteMe
"syntastic
"vim-flake8
"ctrlp (ctrl+p to search for basically anything)

"REPLACED MODULES
"AutoComplPop REPLACED WITH 'YouCompleteMe'
"syntastic REPLACED WITH Vundle managed 'syntastic'


"set nocompatible 


"PYTHON & VUNDLE VIMRC BEGINS HERE
"---------------------------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin) 

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'


" All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required  

"Highlight text over 80 characters in length
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"SimplyFold see docstrings for folded code
let g:SimpylFold_docstring_preview=1

"PEP8 python specific
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"Reveal unnecessary whitespace in python scripts
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Proper indentation for web files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"autocomplete settings 
let g:ycm_autoclose_preview_window_after_completion=1 "autoclose the autocomplete window
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Prettyify my code with color
let python_highlight_all=1
syntax on

"Manage color schemes
"if has('gui_running')
"    set background=dark
"    colorscheme solarized
"else
"    colorscheme zenburn 
"endif

"ORIGINAL VIMRC BEGINS HERE
"--------------------------
set modelines=0

" Enable code section folding 
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set copyindent
imap <C-Return> <CR><CR><C-o>k<Tab>

set encoding=utf-8

set scrolloff=3

set showmode

set showcmd

set hidden

set wildmenu

set wildmode=list:longest

set visualbell

set cursorline

set ttyfast

set ruler

set backspace=indent,eol,start

set laststatus=2

let mapleader = ","

nnoremap \ :NERDTreeToggle

let g:EasyMotion_leader_key = '<Leader>'

set ignorecase

set smartcase

set gdefault

set incsearch

set showmatch

set hlsearch
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %

vnoremap <tab> %

set wrap

set textwidth=79

set formatoptions=qrn1

nnoremap <up> :wincmd k<CR>

nnoremap <down> :wincmd j<CR>

nnoremap <left> :wincmd h<CR>

nnoremap <right> :wincmd l<CR>

nnoremap <c-right> <c-w>>

nnoremap <c-left> <c-w><

nnoremap <c-down> <c-w>-

nnoremap <c-up> <c-w>+

nnoremap <c-=> <c-w>=

nnoremap j gj

nnoremap k gk

inoremap <F1> <ESC>

nnoremap <F1> <ESC>

vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

nnoremap <leader> <plug>(easymotion-prefix)

inoremap jj <ESC>

set number

set hlsearch!

nnoremap <F3> :set hlsearch!<CR>

nnoremap s $

set shortmess+=A

nnoremap <c-j> 10j

nnoremap <c-k> 10k

nnoremap <c-h> ^

nnoremap <c-l> $

set splitbelow

set splitright

let g:syntastic_check_on_open = 1

" Pathogen
execute pathogen#infect()
"call pathogen#helptags() " Generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

set tags=./tags;

map <F5> <C-W>_<C-W><Bar>
let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'
