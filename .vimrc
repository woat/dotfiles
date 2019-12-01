" Plugin Manager / Required
	set rtp+=~/.vim/bundle/Vundle.vim
	filetype off
	call vundle#begin()          
		Bundle 'VundleVim/Vundle.vim'

	" General
		Bundle 'itchyny/lightline.vim'
		Bundle 'jiangmiao/auto-pairs'
		Bundle 'MaxMEllon/vim-jsx-pretty'
		Bundle 'sheerun/vim-polyglot'
		Bundle 'suan/vim-instant-markdown'
		Bundle 'tpope/vim-commentary'
		Bundle 'tpope/vim-surround'
		Bundle 'scrooloose/nerdtree'
		Bundle 'jistr/vim-nerdtree-tabs'
		Bundle 'tpope/vim-markdown'
		Bundle 'christoomey/vim-tmux-navigator'
		Bundle 'w0rp/ale'

	" Colorscheme
		Bundle 'junegunn/seoul256.vim'

	" Golang
		Bundle 'fatih/vim-go'

	" Web-dev
		Bundle 'alvan/vim-closetag'
		Bundle 'mattn/emmet-vim'
	call vundle#end()            
	syntax enable                
	filetype plugin indent on    

" General vim settings
	set hidden 
	set autoread 
	set laststatus=2
	set iskeyword+=-
	set backspace=indent,eol,start
	set virtualedit+=block
	set splitbelow
	set splitright
	set showmode
	set cc=80
	setlocal indentkeys+=0

" Numberline
	set number
	set showcmd

" Tabs
	set shiftwidth=2
	set tabstop=2
	set list lcs=tab:\▏\ 

" Speed
	set nobackup 
	set nowritebackup 
	set noswapfile 
	set ttyfast
	set lazyredraw

" Search settings
	set ignorecase 
	set smartcase 
	set incsearch
	set showmatch
	set hlsearch
	set gdefault

" Colorscheme
	let g:seoul256_background = 235
	colo seoul256

" Mappings
	let mapleader = "\\"

	" Search
		nnoremap / /\v
		vnoremap / /\v

	" NerdTree toggle
		map <leader>] :NERDTreeToggle<CR> 

	" Copy to (real) clipboard
		map <leader>y :%y+<CR>

	" Spellcheck
		map <leader>t :set spell!<CR>

	" Linter
		map <leader>q :ALEToggle<CR>

	" Create V-split and switch
		noremap <leader>v <C-w>v

	" Colorcolumn
		nnoremap <leader>w :let &cc = &cc == '' ? '81' : ''<CR>

	" Vim-like split navigation
		nnoremap <C-h> <C-w>h
		nnoremap <C-j> <C-w>j
		nnoremap <C-k> <C-w>k
		nnoremap <C-l> <C-w>l

	" Clear highlighting
		noremap <leader><space> :noh<cr>:call clearmatches()<cr>

	" Switch to last buffer
		nnoremap <leader><leader> <c-^>

	" Intuitive line movement
		noremap j gj
		noremap k gk

	" Paste
		set pastetoggle=<leader>m

" Variables
	let g:lightline = {'colorscheme': 'seoul256'}

	let g:ale_lint_delay = 100
	let g:ale_sign_column_always = 1

	let g:vue_disable_pre_processors = 1

	let g:polyglot_disabled = ['jsx']

	let g:AutoPairsMultilineClose = 0

	let g:markdown_syntax_conceal = 0
	let g:vim_json_syntax_conceal = 0

	let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.js'

	let g:go_fmt_fail_silently = 1

" Syntax highlighting
	hi link typescriptEndColons Special
	hi link typescriptReserved Include
	hi link goDeclaration Identifier
	hi link goDeclType Identifier
	hi link goBuiltins Function

" Vue fixes
	autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
	autocmd BufEnter *.vue :syntax sync fromstart
