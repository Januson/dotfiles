set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'

call vundle#end()
filetype plugin indent on

set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

set nobackup
set noswapfile
set pastetoggle=<F3>

let NERDTreeQuitOnOpen = 1

map <C-o> :NERDTreeToggle<CR>
noremap <F4> :set invnumber<CR>

