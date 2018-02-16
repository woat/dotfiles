filetype off

" -- local edit log --
" html5            - if statement for vue filetype on template tag
" vim-closetag     - enabled in *.vue,*.hbs,*.ejs

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'

" standard vim
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'junegunn/seoul256.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-markdown'
Bundle 'Yggdroot/indentLine'

" lint engine
Bundle 'w0rp/ale'

" web-dev
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'alvan/vim-closetag'

" html
Bundle 'gregsexton/MatchTag'
Bundle 'othree/html5.vim'
Bundle 'mattn/emmet-vim'

" express - view engines
Bundle 'digitaltoad/vim-pug'

" css
Bundle 'hail2u/vim-css3-syntax'

" scss
Bundle 'cakebaker/scss-syntax.vim'

" js
Bundle 'posva/vim-vue'
Bundle 'pangloss/vim-javascript'

" json
Bundle 'elzr/vim-json'

" tmux 
Bundle 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

let NERDTreeShowHidden=1

" json settings
let g:vim_json_syntax_conceal = 0

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufEnter *.vue :syntax sync fromstart

set ttyfast
set lazyredraw

syntax enable

set number
set showcmd
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" tab settings
set smarttab 
set shiftround 

set autoindent 
set smartindent 
set laststatus=2
set iskeyword+=-
set backspace=indent,eol,start

set nobackup 
set nowritebackup 
set noswapfile 

set hidden 
set autoread 

" search settings
set ignorecase 
set smartcase 
set incsearch
set showmatch
set hlsearch
set gdefault

set virtualedit+=block

set splitbelow
set splitright

set pastetoggle=<leader>m
set showmode

let g:seoul256_background = 235
colo seoul256

nnoremap / /\v
vnoremap / /\v

let mapleader = ","

map <leader>\ :NERDTreeToggle<CR>

map <leader>y :%y+<CR>

" toggle linenumbers
map <leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" spellcheck
map <leader>t :set spell!<CR>

" toggle ale linter
map <leader>q :ALEToggle<cr>

" delete resulting tag side-effect
imap <leader>z <ESC>ldf>a

" set cc + toggle colorcolumn
set cc=80
nnoremap <leader>w :let &cc = &cc == '' ? '81' : ''<CR>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>:IndentLinesToggle<cr>:IndentLinesToggle<CR>

" last buffer switch
nnoremap <leader><leader> <c-^>

noremap j gj
noremap k gk

" paste settings
nnoremap <leader>m :set invpaste paste?<CR>

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

let g:ale_lint_delay = 100
let g:indentLine_color_term = 239
let g:indentLine_char = '▏'
let g:vue_disable_pre_processors=1
let g:AutoPairsMultilineClose = 0
