set nocompatible
filetype off

" Vundle Plugins ------------ {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Townk/vim-autoclose'
"tmux vim navigator
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'nanotech/jellybeans.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

let mapleader = ','
let maplocalleader = "\\"
set foldlevelstart=0

" Vimscript file settings ----------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Basic Settings ----------- {{{
" Always show statusline
"set laststatus=2


 set t_Co=256
" set background=dark
colorscheme elflord

set laststatus=2

let g:airline_detect_modified=1

syntax on

set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>

set backspace=indent,eol,start
set ruler
set showcmd
set showmatch
" set nowrap
"set backupdir=~/.tmp
"set directory=~/.tmp

set sw=4
set expandtab
set smarttab
set ignorecase smartcase
set number

highlight LineNr ctermfg=grey

autocmd FileType html,javascript setlocal ai ts=2 sw=2 sts=2 et

" }}}

" Autocommands -------------------- {{{
" Add automatic commenting functions
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
" }}}

" Normal Mode Mappings ---------- {{{

"Source the vimrc file and write to the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" command to delete current lines and paste before and after the current line
nnoremap <leader>- ddp
nnoremap <leader>_ ddP

" erase current line
nnoremap <leader>e ddO<esc>

" Mapping to insert " and ' around a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel"  
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel'

"Use H to go to the begging of a line and L to go to the end
nnoremap H 0
nnoremap L $
" }}}

" Insert Mode Mappings ---------------------- {{{
"Change how to exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>

inoremap <leader><c-u> <esc>viwUi
inoremap <leader><c-d> <esc>ddi
" }}}

" Visual Mode mappings --------------------- {{{
" in visual mode surround highlighted text with " or '
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll

" }}}

" Operator Mappings --------------- {{{
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
" }}}

" Vim and tmux settings ----- {{{
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"Custom Key Bindings for vim and tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 1
" }}}
