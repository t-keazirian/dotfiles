  1 set nocompatible
  2 filetype off
  3
  4 execute pathogen#infect()
  5 syntax on
  6 filetype plugin indent on
  7
  8 " Use Ctrl + [h,j,k,l] to move window focus
  9 noremap <C-h> <C-w>h
 10 noremap <C-j> <C-w>j
 11 noremap <C-k> <C-w>k
 12 noremap <C-l> <C-w>l
 13
 14 " The NERDTree
 15 map <C-n> :NERDTreeToggle<CR>
 16 let NERDTreeShowHidden=1
 17
 18 " test.vim
 19 nnoremap <Leader>tn :TestNearest<CR>
 20 nnoremap <Leader>tf :TestFile<CR>
 21 nnoremap <Leader>ts :TestSuite<CR>
 22 nnoremap <Leader>tl :TestLast<CR>
 23 nnoremap <Leader>tg :TestVisit<CR>
 24
 25 " vim-mix-format
 26 let g:mix_format_on_save = 1
 27 let g:elm_format_on_save = 1
 28
 29 " UI
 30 set number      " line numbers
 31 set showcmd     " show command at bottom
 32 set showmatch     " highlight matching [{()}]
 33 set clipboard=unnamed   " share clipboard
 34 set tabstop=2     " spaces per tab
 35 set softtabstop=2   " tab while typing
 36 set scrolloff=4     " scroll offset
 37 set backspace=indent,eol,start  " can backspace in insert mode
 38 set mouse=a     " can scroll with mouse
 39 set spell
 40
 41 " Enable folding
 42 set foldmethod=indent
 43 set foldlevel=99
 44 nnoremap <space> za
 45
 46 " set the runtime path to include Vundle and initialize
 47 set rtp+=~/.vim/bundle/Vundle.vim
 48 call vundle#begin()
 49
 50 " Search with ag in VIM
 51 let g:ackprg = 'ag --vimgrep'
 52 cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "ag" ? "Ack" : "ag"
 53
 54
 55 " let Vundle manage Vundle, required
 56 Plugin 'VundleVim/Vundle.vim'
 57
"~/.vimrc" 133L, 4583B
