"NERDTree
"AutoComplPop
"syntastic 
"ctags
"EasyMotion
"NERDCommenter

"create column at column 80
:set colorcolumn=80
:highlight ColorColumn ctermbg=red guibg=red

"Highlight text over 80 characters in length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" sets the gvim (graphical vim) colorscheme. Does nothing in console vim
colorscheme evening

" enables text coloring! Incredibly useful for reading
syntax on 

" some kind of vim defaults setting option. Recommendation is to on, so on it
" goes!
set nocompatible

" apparently the modelines variable controls behavior for vim recognizing vim
" settings within non-vim files! Basically, I don't want any other file other
" than the .vimrc or a plugin to control my vim behavior so we set this to 0
set modelines=0

" tabstop tells vim how many columns a tab counts for. Unless we're in Linux
" kernel code (which expects 8, what garbage) 4 is the sane default
set tabstop=4

" how many columns text is shifted when doing reindent operations. Basically,
" this setting controls indentation when I highlight text in visual mode and
" press shift+> or shift+<. Remember, you can modify how many indents are
" applied by entering a number in normal mode before doing an indent command.
set shiftwidth=4

" how many columns vim uses when you hit tab in insert mode. Not 100% certain
" how this is different than tabstop but sanity says we set it to a good default
set softtabstop=4

" expand 'tab' keypresses to spaces. Most consistent and correct tab behavior
" in 99% of cases. Without this python is hard to work with too.
set expandtab

" basically, keep our current indentation level when we hit enter to make
" a newline unless otherwise specified
set autoindent

" not 100% sure but seems to enforce some indenting spaces/tab behavior from
" the current line onto subsequent lines. Turning on apparently enforces some
" sane indenting behavior.
set copyindent

" intelligently adds indentation when editting code based on syntax
set smartindent

" a fancy hack so to give better handling of indentation and cursor position
" when pressing enter within parenthesis/curly braces/braces
imap <C-Return> <CR><CR><C-o>k<Tab>

" sets how vim represents characters internally. Apparently necessary for sane 
" unicode handling
set encoding=utf-8

" sets the minimum number of lines to display above/below the cursor when
" moving up or down lines. IE, if you hold 'j' to go down through a file, it'll
" start moving the text upward when you get within 3 lines of the bottom of the
" vim window. 
set scrolloff=3

" This setting tells you in the bottom of the window the mode your in when
" *not* in normal mode. IE, will tell you when in visual mode or insert mode
set showmode

" I guess it shows your last entered command? (commands are entered from the
" command mode using the : key from normal mode)
set showcmd

" makes it so if vim is still open closed splits/windows don't throw out
" buffers. Instead they're hidden in the background. Can see available buffers
" with :buffers and select a buffer with :b[a number]. Example, :b1 opens
" buffer 1 in your window
set hidden

" enhances vim command-line completion (as opposed to IDE code completion)
set wildmenu
set wildmode=list:longest

" sets a visual effect instead of an audible beep where applicable. Beeps suck
set visualbell

" highlights the line you're on. YES PLS
set cursorline

" some kind of efficiency boost for text drawing. I'm never ever gonna use this
" .vimrc on a slow connection (ie, some kind of serial connection) so it's a no
" brainer
set ttyfast

" show the current line number and cursor position at the bottom right
set ruler

" display line numbers to the left of each line
set number

" sane defaults for controlling the 'backspace' key
set backspace=indent,eol,start

" makes it so we always have a status line (line that displays our open file
" name our cursor's position and % of the way through a file. Uses a line, but is generally helpful
set laststatus=2

" set our leader key (key that tells vim we're invoking a special non vim
" default command)
let mapleader = ","

" Toggle NERDTree file window with backslash. 
nnoremap \ :NERDTreeToggle

" ignore case in search patterns. This is sane behavior 99% of the time when
" I do a blanket search with all lowercase
set ignorecase

" Overrides ignorecase if I include any uppercase letters in my search. Useful
" because it lets me search extra specifically if I need to
set smartcase

" turnning this on means that global search/replace will only work on the first
" instance in a line rather than on all instances. Set off because this
" behavior is generally not useful to me
"set gdefault

" start searching as soon as you start typing in the search window (press '/'
" to open the search window)
set incsearch

" highlight the matching parenthesis/brace/curly brace when highlighting one
set showmatch

" highlight most recent matches to a search, even when the search is closed
set hlsearch

" toggles between the two? might need to turn off in this case because it's
" overwriting hlsearch
"set hlsearch!

" remove search highlighting. Didn't find this super useful and I think there's
" a common key conflict (or one close enough that it's not worth competing)
"nnoremap <leader><space> :noh<cr>

" The following two et 'tab' key to jump between the paired opening/closing 
" parenthesis/brace/curly brace that you have highlighted by your cursor
nnoremap <tab> %
vnoremap <tab> %

" one of the most necessary sane defaults. This causes lines to wrap rather
" than continue offscreen.
set wrap

" I guess it breaks text into newlines when you exceed 79 characters?
set textwidth=79

" internet recommendations for sane default formatting
set formatoptions=qrn1

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
nnoremap <c-=> <c-w>=

" Training wheels mapping to disable arrowkeys in edit mode. Doesn't matter
" for me because I'm a masta! Useful if you're new to train you to use hjkl keys
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" the following two make j/k go up/down visual lines (what vim actually
" displays with its text wrapping) rather than physical lines (a line being
" defined as ending with \n or \r\n)
nnoremap j gj
nnoremap k gk

" following 3 set F1 equal to ESC (fixes common typing mistake)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" set ; equal to : (basically fixes common mistake when typing)
nnoremap ; :

" automatically save progress when you click on something other than vim
" au FocusLost * :wa

" ,+w open up a new split (buffer set to the same as the current split)
nnoremap <leader>w <C-w>v<C-w>l

" sets the easymotion leader key to be equal to the vim leader key
let g:EasyMotion_leader_key = '<Leader>'

" ,+w to jump to a word beneath the cursor 
" ,+b to jump to a word above the cursor
nnoremap <leader> <plug>(easymotion-prefix)

" set j+j (pressing 'j' twice) to exit text edit mode
"inoremap jj <ESC>
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

"

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
" code tags
set tags=./tags;

"Press F5 to set split fullscreen
map <F5> <C-W>_<C-W><Bar> 

"let slimv know where the swank lisp script is stored. Necessary for slimv SBCL
"REPL integration, which is basically 100% of slimv does so we include it here!
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'

set termguicolors

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


"GUI ONLY
if has("gui_running")
    "automatically start with NERDTree drawer open
    autocmd VimEnter * NERDTreeToggle 

    set guioptions -=T
    set guifont=Fixedsys:h11
    au GUIEnter * simalt ~x
endif 

"set the file format to dos. Could be dangerous if moving files betwen unix and
"windows systems? However it fixes the ^M showing up at the end of lines
au BufEnter /* e ++ff=dos 

