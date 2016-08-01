set nocompatible
filetype off

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

"tmux vim navigator
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'morhetz/gruvbox'

Plugin 'chriskempson/base16-vim'

Plugin 'nanotech/jellybeans.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = ','


 set t_Co=256
" set background=dark
 colorscheme elflord


syntax on

autocmd FileType html,javascript setlocal ai ts=2 sw=2 sts=2 et

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

"au VimEnter * NERDTree



"Vim and tmux settings
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


"Remap increment from c-a to a-a
