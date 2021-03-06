" ======================================
" Early Setup
" ======================================
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround' 
Plugin 'tomtom/tcomment_vim' " automatic commenting with gc{motion}
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ','
let maplocalleader = "\\"

" =====================================
" Colorscheme 
" =====================================
"
set t_Co=256
set background=dark
" colorscheme solarized
" set background=dark
colorscheme atom-dark-256
set guifont=hack:h14
" set guifont=Monaco:h16

" When to show a statusline: 2 - always
set laststatus=2
let g:airline_detect_modified=1
let g:airline_detect_whitespace=0

" Enable syntax highlighting
syntax on

" Set line wraping
set nowrap

" Use the promp '>  ' for wrapped lines.
let &showbreak="   "

"Break Lines at reasonable places instead of mid-word
set linebreak

" How far to scroll sideways when wrapping is off
set sidescroll=5

" set listchars+=precedes:<,extends:>
set listchars=trail:·,nbsp:·,extends:>,precedes:<,eol:$

" Allow backspace over everything in insert mode
set backspace=indent,eol,start

" Show 'ruler' at bottom (cursuor posiiton et al.).
set ruler

set showcmd
set showmatch
set sw=4
set expandtab
set smarttab
set autoindent
set smartindent
set ignorecase smartcase
set number
set hlsearch

highlight LineNr ctermfg=grey

autocmd FileType ruby,rb,mhtml,yml,yaml,javascript setlocal ai ts=2 sw=2 sts=2 et

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open=0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open=0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open=1
    endif
endfunction


" Autocommands 
" Add automatic commenting functions
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>



"======================================
" Normal Mode Mappings 
"======================================
"

"Source the vimrc file and write to the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" command to delete current lines and paste before and after the current line
 nnoremap <leader>a ddp

" erase current line
nnoremap <leader>e ddO<esc>

" Mapping to insert " and ' around a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel"  
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel'

"Use H to go to the begging of a line and L to go to the end
nnoremap H 0
nnoremap L $

" Use Y to yank to the end of the line and not include the end line character
nnoremap Y y$

"Add a semicolon on the end of the line and return to the start of the line
nnoremap <leader>; mqA;<esc>'q

"Grep search for the string under the current word and open a quick fix window
"with the results
nnoremap <leader>g :silent execute "grep! -R ". shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

"TooooDooooo I need something to grab a line in normal mode
"and make it so that I can easily paste it into some other spot
"inline


"======================================
" Insert Mode Mappings 
"======================================

"Change how to exit insert mode
inoremap jk <esc>
"inoremap <esc> <nop>

inoremap <leader><c-u> <esc>viwUi
inoremap <leader><c-d> <esc>ddi

" Visual Mode mappings 
" in visual mode surround highlighted text with " or '
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll

"Use H to go to the beginning of a line and L to go to the end in visual mode
vnoremap H 0
vnoremap L $

" ======================================
" Buffer Mappings 
" ======================================
"
" Type leader lb to open the last buffer in a split right below the current
" split
nnoremap <leader>lb :execute "rightbelow vsplit " . bufname("#") <cr>


" ======================================
" Operator Mappings 
" ======================================
"
" Find next ( and change inside and around it
" Find previous ( and change inside and around it
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" Find next { and change inside and around it
" Find previous { and change inside and around it
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

" ======================================
" Vim and tmux settings 
" ======================================
"
" Map h, j, k, l to move between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Custom Key Bindings for vim and tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 1
