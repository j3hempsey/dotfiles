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
" Bundle 'https://github.com/scrooloose/syntastic.git'
" VimWiki
Bundle 'https://github.com/vimwiki/vimwiki.git'
" Git changes
Bundle 'https://github.com/airblade/vim-gitgutter.git'
" Smooth Scrolling
Bundle 'https://github.com/terryma/vim-smooth-scroll.git'
" Tabar: Tag view
Bundle 'https://github.com/majutsushi/tagbar.git'
" Fugative - Git tools
Bundle 'https://github.com/tpope/vim-fugitive.git'
" Closing tags
Bundle 'docunext/closetag.vim'
" Last cursor position
Bundle 'https://github.com/farmergreg/vim-lastplace.git'
" Rust stuff
Plugin 'rust-lang/rust.vim'
" Ack wrapper
Plugin 'mileszs/ack.vim'
" Async tasks
Bundle 'https://github.com/tpope/vim-dispatch.git'
" Localvimrc
Bundle 'https://github.com/embear/vim-localvimrc.git'
" Powerline
"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Viz undo
" TODO: Figure it out https://sjl.bitbucket.io/gundo.vim/
Bundle 'http://github.com/sjl/gundo.vim.git'
" Trailing whitespace highlighting/cleaning https://github.com/ntpeters/vim-better-whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Ale supersceeds Syntastic
Plugin 'dense-analysis/ale'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" ========= END ======== "
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
set visualbell      " Use visual bell (no beeping)
set cursorline		" Highlight current line
syntax on
set showcmd			" Show information about the command you're running
set noexpandtab		" Insert spaces instead of tabs

set incsearch		" Search as charecters are entered
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally

set autoindent		" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
"set shiftwidth=3   " For badu...
set tabstop=4		" Number of spaces a tab counts for
"set tabstop=3
set softtabstop=4	" Number of spaces per Tab
"set softtabstop=3
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
" Tab completion more BASH-like
set wildmode=longest,list,full
set wildmenu
set modeline
"" Advanced
set ruler			" Show row and column ruler information
set foldmethod=syntax " Set fold ability on syntax
set foldlevelstart=10 " Automatically fold at block level of 10
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set wildmenu		" Visual autocomplete for command menu
set lazyredraw		" Redraw only when we need to
set foldlevelstart=10
silent! so .vimlocal " Source a local 'vimrc' to override settings
" https://github.com/joelhooks/dotfiles/blob/master/.vim/vimrc
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" Status bar
set laststatus=2
set statusline=%c:     "cursor column
set statusline+=%l/%L\   "cursor line/total lines
set statusline+=%t       "tail of the filename
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k
set statusline+=\ %P    "percent through file
au FileType gitcommit setlocal tw=72        " Set linewrap in git commit messages only
au FileType markdown setlocal tw=80         " Set linewrap in markdown files only
au FileType rst setlocal tw=80              " Set linewrap in restructuredtext files only
au FileType terraform setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType terraform-vars setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"set statusline+=
set cc=100
" :help syntax -> naming convention header to see color mapping to symbols
" Set various colors
hi Comment      ctermfg=LightBlue
hi Todo         ctermfg=Black ctermbg=LightBlue
hi Search       ctermfg=DarkRed ctermbg=LightYellow
hi String       ctermfg=DarkBlue
hi Number       ctermfg=Red
hi Visual       ctermfg=Black
hi LineNr       ctermfg=LightGrey ctermbg=DarkGrey
hi CursorLineNr ctermfg=LightGrey
hi Statement    ctermfg=DarkGreen
hi Type         ctermfg=DarkCyan
hi ColorColumn  ctermbg=DarkBlue

""" Key remapings """
" <Leader> = \ key
nnoremap <Leader>a :Ack!<Space>
nmap <silent> <C-N> :NERDTreeToggle<CR>
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
" Remap paging to smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 5)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 5)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 5)<CR>
" Remap page up/down to use the scolling too
noremap <silent> <PageUp> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <PageDown> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" Show tagbar
nmap <F8> :TagbarToggle<CR>

set viminfo='10,\"100,:20,%,n~/.viminfo
command! -nargs=* CL call CompareLines(<f-args>)
function! CompareLines(...)
   " Check the number of arguments
   " And get lines numbers
   if len(a:000) == 0
      let l1=line(".")
      let l2=line(".")+1
   elseif len(a:000) == 1
      let l1 =line(".")
      let l2 =a:1
   elseif len(a:000) == 2
      let l1 = a:1
      let l2 = a:2
   else
      echom "bad number of arguments"
      return;
   endif

   " Get the content of the lines
   let line1 = getline(l1)
   let line2 = getline(l2)

   let pattern = ""

   " Compare lines and create pattern of diff
   for i in range(strlen(line1))
      if strpart(line1, i, 1) != strpart(line2, i, 1)
         if pattern != ""
            let pattern = pattern . "\\|"
         endif
         let pattern = pattern . "\\%" . l1 . "l" . "\\%" . ( i+1 ) . "c"
         let pattern = pattern . "\\|" . "\\%" . l2 . "l" . "\\%" . ( i+1 ) . "c"
      endif
   endfor

   " Search and highlight the diff
   execute "let @/='" . pattern . "'"
   set hlsearch
   normal n
endfunction

" Ctrlp
set wildignore+=*.so,*.swp,*.zip,*.o,*.ko,*.d,*.Td
" Unlimited files in cache
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_follow_symlinks=1
" More results in search window
let g:ctrlp_match_window= 'results:50'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]centos\.debug$',
  \ 'file': '\v\.(exe|so|dll|o|d|Td)$',
  \ }

" Syntastic hurts vim on mac so do some fancy stuff to not hurt the mac
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"Powerline settings
set guifont=IBM\ Typeface:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Undo stuff
set undofile
set undodir=~/.vim/undodir
" Delete things in the undo directory older than 30 days
let s:undos = split(globpath(&undodir, '*'), "\n")
call filter(s:undos, 'getftime(v:val) < localtime() - (60 * 60 * 24 * 30)')
call map(s:undos, 'delete(v:val)')

" Ack stuff
let g:ack_use_dispatch=1
" cnoreabbrev Ack Ack!

" Localvimrc config options
let g:localvimrc_name = [ '.localvimrc' ]
let g:localvimrc_ask = 0

"Powerline settings
set guifont=IBM\ Typeface:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
" Vim better whitespace config
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=0
" let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1 " Cannot be automatically corrected.
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']

" sudo write
command! W w !sudo tee % > /dev/null

" Show tabs
set list
set listchars=tab:··

" GitGutter
highlight! link SignColumn LineNr
highlight GitGutterAdd    ctermfg=DarkGreen  ctermbg=DarkGrey
highlight GitGutterChange ctermfg=DarkYellow ctermbg=DarkGrey
highlight GitGutterDelete ctermfg=DarkRed    ctermbg=DarkGrey

" Ale configuration
let g:ale_lint_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Add Ale to status line
function! LinterStatus() abort
	let l:counts = ale#statusline#Count(bufnr(''))

	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors

	return l:counts.total == 0 ? 'OK' : printf(
				\   '%dW %dE',
				\   all_non_errors,
				\   all_errors
				\)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
