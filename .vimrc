" FZF
set rtp+=/usr/local/opt/fzf

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
let g:ale_lint_delay = 100
let g:ale_sign_column_always = 1
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['jsx', 'ts']
let g:vim_json_syntax_conceal = 0
Plug 'fatih/vim-go'
let g:go_fmt_fail_silently = 1
let g:go_list_type = 'quickfix'
call plug#end()

" General vim settings
set noswapfile
set hidden 
set showmode
set nobackup 
set nowritebackup 
set number
set showcmd
set autowrite
set splitbelow
set splitright
colo ron

" Disable scratch buffer for <C-x><C-o>
set completeopt-=preview

" Search settings
set hlsearch
set ignorecase 
set smartcase 

" kitty
let &t_ut=''

let mapleader = ","

" line movement
map j gj
map k gk

" New file
map <leader>e :e %:h/

" FZF
map <leader>p :Files<CR>
map <leader>f :Rg<CR>
map <leader>h :History<CR>

" vim-go
map <leader>r :GoReferrers<CR>
map <leader>d :GoDecls<CR>

" Quickfix 
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

nnoremap <leader>. :noh<CR>

" Convert tabs to spaces for web-dev
autocmd Filetype html,css,javascript,typescript setlocal tabstop=2 shiftwidth=2 expandtab
