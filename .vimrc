"PLUGINS:
"NERDTree
"AutoComplPop
"syntastic 
"EasyMotion
"NERDCommenter

packadd! onedark.vim 

"create column at column 80
:set colorcolumn=80
:highlight ColorColumn ctermbg=red guibg=red

"colorscheme evening " sets the text colorscheme
colorscheme onedark  

syntax on " enables text coloring! Incredibly useful for reading

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=scheme
endif 

"let g:NERDTreeDirArrows=0
:set encoding=utf-8

set nocompatible " enables full vim mode by disabling vi compatibility
set modelines=0 " number of lines checked for set commands
set tabstop=4 " number of spaces that a tab in the file counts for
set shiftwidth=4 " how many columns text is shifted with shift+> and shift+<
set softtabstop=4 " number of spaces that a tab counts fo rwhile performing editing operations
set expandtab " expand 'tab' keypresses to spaces
set autoindent " automatically indent a new line
set copyindent " Copy the structure of the existing line indent when autoindenting a new line
set smartindent " intelligently adds indentation when editting code based on syntax
set encoding=utf-8 " sets how vim represents characters internally. Necessary for sane unicode handling
set scrolloff=3 " sets the minimum number of lines to display above/below the cursor when moving up or down lines.
set showmode " indicates what mode you are in in the status line
set showcmd " show last command entered in status window
set hidden " closed splits/windows hide buffer in the background
set wildmenu " enhances vim command-line completion (as opposed to IDE code completion)
set wildmode=list:longest
set visualbell " sets a visual effect instead of an audible beep where applicable. Beeps suck
set cursorline " highlights the line you're on
set ttyfast " some kind of efficiency boost for text drawing.
set ruler " show the current line number and cursor position at the bottom right
set number " display line numbers to the left of each line
set backspace=indent,eol,start " sane defaults for controlling the 'backspace' key
set laststatus=2 " makes it so we always have a status line at the bottom of the window
set ignorecase " ignore case in search patterns. This is sane behavior 99% of the time when I do a blanket search with all lowercase
set smartcase " Overrides ignorecase if I include any uppercase letters in my search.
set incsearch " start searching as soon as you start typing in the search window (press '/' to open the search window)
set showmatch " highlight the matching parenthesis/brace/curly brace when highlighting one
set hlsearch " highlight most recent matches to a search, even when the search is closed
set wrap " This causes lines to wrap rather than continue offscreen.
set textwidth=79 " Attempts to breaks text into newlines when you exceed 79 characters
set formatoptions=qrn1 " internet recommendations for sane default formatting
set termguicolors "enables color in the terminal. A new feature that may require windows 10

" set our leader key (key that tells vim we're invoking a special non vim
" default command)
let mapleader = ","

" Toggle NERDTree file window with backslash. 
"nnoremap \ :NERDTreeToggle
nnoremap \ :Explore<CR>

nnoremap <leader>t :vertical terminal<CR>

" a fancy hack so to give better handling of indentation and cursor position
" when pressing enter within parenthesis/curly braces/braces
imap <C-Return> <CR><CR><C-o>k<Tab>

" My amazing custom split controls!
" Arrowkeys in normal mode switch between splits intelligently  (ie, right
" key moves your cursor to  the adjacent split to the right of the current split).
" Additionally, ctrl+arrowkeys dynamically resizes split windows! Amazing!
nnoremap <up> :wincmd k<CR>
nnoremap <down> :wincmd j<CR>
nnoremap <left> :wincmd h<CR>
nnoremap <right> :wincmd l<CR>
nnoremap <c-right> <c-w>>
nnoremap <c-left> <c-w><
nnoremap <c-down> <c-w>-
nnoremap <c-up> <c-w>+
nnoremap <c>= <c-w>=

" the following two make j/k go up/down visual lines (what vim actually
" displays with its text wrapping) rather than physical lines (a line being
" defined as ending with \n or \r\n)
nnoremap j gj
nnoremap k gk

" following 3 set F1 equal to ESC (fixes common typing mistake)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" set ; equal to : in normal mode (basically fixes common mistake when typing)
nnoremap ; :

" sets the easymotion leader key to be equal to the vim leader key
let g:EasyMotion_leader_key = '<Leader>'

" ,+w to jump to a word beneath the cursor 
" ,+b to jump to a word above the cursor
nnoremap <leader> <plug>(easymotion-prefix)

" set j+j (pressing 'j' twice) to exit text edit mode
"inoremap jj <ESC>
inoremap <S-CR> <ESC>
inoremap jk <ESC>

" toggle search highlighting with the F3 key
nnoremap <F3> :set hlsearch!<CR>

" set 's' key to go to the end of the line (like the 'End' button)
nnoremap s $

" option to skip specific vim messages that force you to hit enter. 'A'
" apperently skips the message telling you an existing vim swap file was found.
set shortmess+=A

" ctrl+j go up 10 lines
nnoremap <c-j> 10j

" ctrl+k go down 10 lines
nnoremap <c-k> 10k

" ctrl+h go to the beginning of the line
nnoremap <c-h> ^

" ctrl+l: go to the end of the line
nnoremap <c-l> $

" when creating a horizontal split the new window will appear below instead of
" above your current window
set splitbelow

" when creating a vertical split the new window will appear to the right
" instead of the left of your current window
set splitright

" when set makes the NERDTree toggable file window open with ,+t
"map <leader>t NERDTreeToggle

" some kind of important option for the syntastic code syntax plugin
let g:syntastic_check_on_open = 1

" not 100% but seems to control when these vimrc settings are applied when
" working with different filetypes?
filetype plugin indent on

" filename for the tags command (like ctags) that vim will look for when using
" code tags. Causes vim to start looking in parent folders for tags through 
" *tricksyness*
set tags=./tags;

"Press F5 to set split fullscreen
map <F5> <C-W>_<C-W><Bar> 

"let slimv know where the swank lisp script is stored. Necessary for slimv SBCL
"REPL integration, which is basically 100% of slimv does so we include it here!
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'


"Ctags settings
"Goto ctag def
menu Tags.Goto\ Definition<tab><C-]> <C-]>
menu PopUp.Goto\ Definition<tab><C-]> <C-]>

"Cscope settings
"0 or s: Find this C symbol
nnoremap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
menu Tags.Goto\ Symbol\ Usages<tab><C-[>s <C-[>s
menu PopUp.Goto\ Symbol\ Usages<tab><C-[>s <C-[>s

"1 or g: Find this definition
nnoremap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
menu Tags.Goto\ Cscope\ Definition<tab><C-[>g <C-[>g

"2 or d: Find functions called by this function
nnoremap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

"3 or c: Find functions calling this function
nnoremap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
menu Tags.Goto\ Function\ Usages<tab><C-[>c <C-[>c
menu PopUp.Goto\ Function\ Usages<tab><C-[>c <C-[>c

"4 or t: Find this text string
nnoremap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
menu Tags.Goto\ Text\ Usages<tab><C-[>t <C-[>t
menu PopUp.Goto\ Text\ Usages<tab><C-[>t <C-[>t

"6 or e: Find this egrep pattern
nnoremap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>	

"7 or f: Find this file
nnoremap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	

"8 or i: Find files #including this file
nnoremap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

"9 or a: Find places where this symbol is assigned a value
nnoremap <C-[>a :cs find a <C-R>=expand("<cword>")<CR>$<CR>


function ToggleFlag(option,flag)
  exec ('let lopt = &' . a:option)
  if lopt =~ (".*" . a:flag . ".*")
    exec ('set ' . a:option . '-=' . a:flag)
  else
    exec ('set ' . a:option . '+=' . a:flag)
  endif
endfunction

"GUI ONLY
if has("gui_running")
    "automatically start with NERDTree drawer open
    "autocmd VimEnter * NERDTreeToggle 

    set guioptions -=T
    set guioptions -=m
    set guioptions-=r
    set guioptions-=L
    set guifont=Fixedsys:h11
    au GUIEnter * simalt ~x

    nnoremap <C-m> :call ToggleFlag("guioptions","m")<CR>
endif 

"set guifont=Consolas:h11
"set guifont=Inconsolata:h12
"set guifont=Ubuntu\ Mono:h12
:tnoremap <Esc> <C-\><C-n>

autocmd FileType haskell set tabstop=8                   "A tab is 8 spaces
autocmd FileType haskell set expandtab                   "Always uses spaces instead of tabs
autocmd FileType haskell set softtabstop=4               "Insert 4 spaces when tab is pressed
autocmd FileType haskell set shiftwidth=4                "An indent is 4 spaces
autocmd FileType haskell set shiftround                  "Round indent to nearest shiftwidth multiple


"set the file format to dos. Could be dangerous if moving files betwen unix and
"windows systems? However it fixes the ^M showing up at the end of lines
"au BufEnter /* e ++ff=dos 
let g:paredit_mode=0
