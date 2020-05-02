" FZF
set rtp+=/usr/local/opt/fzf

" Plugins
	call plug#begin('~/.vim/plugged')

	" General
		Plug 'jremmen/vim-ripgrep'
		Plug 'junegunn/fzf'
		Plug 'itchyny/lightline.vim'
			let g:lightline = {
						\ 'colorscheme': 'seoul256',
						\ 'component': {
						\ 	'filename': '%F',
						\}
						\}
		Plug 'jiangmiao/auto-pairs'
			let g:AutoPairsMultilineClose = 0
		Plug 'sheerun/vim-polyglot'
			let g:polyglot_disabled = ['jsx']
			let g:vue_disable_pre_processors = 1
			let g:vim_json_syntax_conceal = 0
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-markdown'
			let g:markdown_syntax_conceal = 0
		Plug 'christoomey/vim-tmux-navigator'
		Plug 'dense-analysis/ale'
			let g:ale_lint_delay = 100
			let g:ale_sign_column_always = 1

	" Colorscheme
		Plug 'junegunn/seoul256.vim'
			let g:seoul256_background = 235

	" Golang
		Plug 'fatih/vim-go'
			let g:go_fmt_fail_silently = 1
			let g:go_list_type = "quickfix"

	" Web-dev
		Plug 'alvan/vim-closetag'
			let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.js'

	call plug#end()

" General vim settings
	syntax enable                
	filetype plugin indent on    

	set autoread 
	set autowrite
	set backspace=indent,eol,start
	set hidden 
	set iskeyword+=-
	setlocal indentkeys+=0
	set laststatus=2
	set grepprg=rg
	set splitright
	set splitbelow
	set showmode
	set virtualedit+=block

" Omnicompletion
	set completeopt=menu

" Numberline
	set number
	set showcmd

" Tabs
	set autoindent
	set copyindent
	set list lcs=tab:\▏\ 
	set tabstop=2
	set shiftwidth=2
	set smarttab

" Speed
	set lazyredraw
	set nobackup 
	set nowritebackup 
	set noswapfile 
	set re=1
	set ttyfast

" Search settings
	set hlsearch
	set ignorecase 
	set incsearch
	set gdefault
	set smartcase 
	set showmatch

	colo seoul256

" Mappings
	let mapleader = "`"

	" Search
		nnoremap / /\v
		vnoremap / /\v

	" Paste
		set pastetoggle=<leader>m

	" File line search
		map <leader>f :Rg<CR>

	" Copy to (real) clipboard
		map <leader>y :%y+<CR>

	" Spellcheck
		map <leader>t :set spell!<CR>

	" Linter
		map <leader>q :ALEToggle<CR>

	" FZF
		map <C-p> :FZF<CR>

	" Quickfix 
		map <C-n> :cnext<CR>
		map <C-m> :cprevious<CR>
		nnoremap <leader>a :cclose<CR>

	" Create V-split and switch
		noremap <leader>v <C-w>v

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

" Syntax highlighting
	hi link typescriptEndColons Special
	hi link typescriptReserved Include
	hi link goDeclaration Identifier
	hi link goDeclType Identifier
	hi link goBuiltins Function
	hi link goVarArgs Identifier

	hi! link Function Conditional
	hi! link Identifier Conditional
	hi! link Statement Conditional
	hi! link Repeat Conditional
	hi! link Keyword Conditional

	hi! link Type String
	hi! link Todo String
	hi! link Number String
	hi! link Boolean String

	hi SpecialKey ctermfg=237
	hi Comment ctermfg=246

" hi group finder
	map <leader>g :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
				\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
				\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Vue fixes
	autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
	autocmd BufEnter *.vue :syntax sync fromstart

" run :GoBuild or :GoTestCompile based on the go file
	function! s:build_go_files()
		let l:file = expand('%')
		if l:file =~# '^\f\+_test\.go$'
			call go#test#Test(0, 1)
		elseif l:file =~# '^\f\+\.go$'
			call go#cmd#Build(0)
		endif
	endfunction

	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>	

	" let g:go_metalinter_autosave=1
	" let g:go_metalinter_command='golangci-lint'
	" let g:go_metalinter_autosave_enabled = []
	" let g:go_metalinter_enabled = []
