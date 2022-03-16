set nocompatible
filetype off

execute pathogen#infect()
syntax on
filetype plugin indent on

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

" UI
set number			" line numbers
set showcmd			" show command at bottom
set showmatch			" highlight matching [{()}]
set clipboard=unnamed		" share clipboard
set tabstop=2			" spaces per tab
set softtabstop=2		" tab while typing
set scrolloff=4			" scroll offset
set backspace=indent,eol,start	" can backspace in insert mode
set mouse=a			" can scroll with mouse

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
Plugin 'slashmili/alchemist.vim'                   " Elixir plugin for ElixirSense
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
Plugin 'fisadev/vim-isort'												 " call :Isort command and will reorder imports of current python file

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
au FileType json setl sw=2 sts=2 et                " Indentation for json

" More Haskell stuff
"let g:airline#extensions#ale#enabled = 1
"nnoremap <Leader>ht :GhcModType<cr>
"nnoremap <Leader>htc :GhcModTypeClear<cr>
"autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" Better search
set hlsearch
set incsearch

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

