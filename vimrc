set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" very nice file browser
Bundle 'scrooloose/nerdtree'
" full path fuzzy search
Bundle 'kien/ctrlp.vim'
" pretty sweet linting/error checking. Works on save
Bundle 'https://github.com/scrooloose/syntastic.git'
" VimWiki
Bundle 'https://github.com/vimwiki/vimwiki.git'
" Git changes
Bundle 'https://github.com/airblade/vim-gitgutter.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"" General
set number	        " Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=++++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
" set spell			" Enable spell-checking
set visualbell	   	" Use visual bell (no beeping)
set cursorline		" Highlight current line
syntax on
set showcmd			" Show information about the command you're running
set expandtab		" Insert spaces instead of tabs

set incsearch		" Search as charecters are entered
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
 
set autoindent		" Auto-indent new lines
"set shiftwidth=4	" Number of auto-indent spaces
 set shiftwidth=3   " For badu...
"set tabstop=4		" Number of spaces a tab counts for
set tabstop=3
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
"set softtabstop=4	" Number of spaces per Tab
set softtabstop=3 
"" Advanced
set ruler			" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set wildmenu		" Visual autocomplete for command menu
set lazyredraw		" Redraw only when we need to
" https://github.com/joelhooks/dotfiles/blob/master/.vim/vimrc
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
nmap <silent> <C-I> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
" Save file
inoremap <C-s> <esc>:w<cr> 
" Quit
inoremap <C-q> <esc>:q<cr>
" Save and quit
inoremap <C-w-q> <esc>:wq<cr>
" Save file
nnoremap <C-s> :w<cr>
" Quit
nnoremap <C-q> :q<cr>
" Save and quit 
nnoremap <C-w-q> :wq<cr>
