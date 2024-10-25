set nocompatible

syntax on

" Use Ctrl + [h,j,k,l] to move window focus
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" The NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" test.vim
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tg :TestVisit<CR>

" vim-mix-format
let g:mix_format_on_save = 1
let g:elm_format_on_save = 1

" Disable swap files
set noswapfile

" Nicer colors for status and command line
set laststatus=2

" More readable command line mode completion
set wildmenu

" UI
set number			" line numbers
set ruler       " show the cursor position
set showcmd			" show command at bottom
set showmatch			" highlight matching [{()}]
set clipboard=unnamedplus		" share clipboard and work with ctrl+v and ctrl+c

set tabstop=4			" spaces per tab
set shiftwidth=4  " shifts left or right by four spaces
set softtabstop=4		" tab while typing
set scrolloff=4			" scroll offset

set spell
" autocmd FileType markdown,text,gitcommit setlocal spell
set backspace=indent,eol,start	" can backspace in insert mode
set mouse=a			" can scroll with mouse
set expandtab " converts tabs to spaces
set wrap " enable line wrapping

set undofile " enable persistent undo

" Split window behavior
set splitright       " Vertical splits will automatically go to the right
set splitbelow       " Horizontal splits will automatically go below

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Search with ag in VIM
let g:ackprg = 'ag --vimgrep'
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "ag" ? "Ack" : "ag"

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'avakhov/vim-yaml'                          " Yaml syntax
Plugin 'bronson/vim-trailing-whitespace'           " Hightlight trailing whitespace
Plugin 'kien/rainbow_parentheses.vim'              " Parenthesis highlighting
Plugin 'MarcWeber/vim-addon-mw-utils'              " Interprets file by extension
Plugin 'tpope/vim-surround'                        " Better parenthesis support
Plugin 'itchyny/lightline.vim'                     " Better status line
Plugin 'git@github.com:itchyny/vim-gitbranch.git'  " Git Branch display
Plugin 'elmcast/elm-vim'                           " Elm plugin
Plugin 'elixir-lang/vim-elixir'                    " Elixir plugin
Plugin 'elzr/vim-json'                             " Json
Plugin 'w0rp/ale'                                  " Linting engine
Plugin 'pangloss/vim-javascript'                   " Javascript
Plugin 'othree/yajs.vim'                           " javascript syntax
Plugin 'mxw/vim-jsx'                               " JSX highlighting
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc'
Plugin 'rust-lang/rust.vim'                        " Rust plugin
Plugin 'preservim/nerdtree'                        " The NERDTree
Plugin 'tomlion/vim-solidity'                      " Solidity syntax
Plugin 'leafgarland/typescript-vim'                " Typescript syntax
Plugin 'mileszs/ack.vim'                           " ack.vim (brew install ack the_silver_searcher)
Plugin 'tmhedberg/SimpylFold'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'fisadev/vim-isort'							" call :Isort command and will reorder imports of current python file

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
au FileType json setl sw=2 sts=2 et                " Indentation for json

" Better search
set hlsearch
set incsearch
set ignorecase
set smartcase     "type all lowercase = case-insensitive; type one+ words uppercase = case-sensitive

" Git Branch/Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
" ================================================ ale lint ==========================================
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\    'python': ['black', 'isort'],
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

" Changes cursors depending on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
