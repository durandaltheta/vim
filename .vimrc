"NERDTree
"AutoComplPop
"syntastic 
"ctags
"EasyMotion
"NERDCommenter

"Highlight text over 80 characters in length
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set nocompatible

set modelines=0

set tabstop=4

set shiftwidth=4

set softtabstop=4

set expandtab

set smartindent

imap <C-Return> <CR><CR><C-o>k<Tab>

set encoding=utf-8

set scrolloff=3

set autoindent

set copyindent

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

"nnoremap / /\v

"vnoremap / /\v

set ignorecase

set smartcase

set gdefault

set incsearch

set showmatch

set hlsearch

"nnoremap <leader><space> :noh<cr>

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

"inoremap <up> <nop>

"inoremap <down> <nop>

"inoremap <left> <nop>

"inoremap <right> <nop>

nnoremap j gj

nnoremap k gk

inoremap <F1> <ESC>

nnoremap <F1> <ESC>

vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa

"nnoremap <leader>w <C-w>v<C-w>l

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

"map <leader>t NERDTreeToggle

"set statusline+=%#warningmsg#

"set statusline+=%{SyntasticStatuslineFlag()}

"set statusline+=%*

"let g:syntastic_always_populate_loc_list =1

"let g:syntastic_auto_loc_list = 1

let g:syntastic_check_on_open = 1

"let g:syntastic_check_on_wq = 0

" Pathogen
execute pathogen#infect()
"call pathogen#helptags() " Generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

set tags=./tags;

map <F5> <C-W>_<C-W><Bar>
