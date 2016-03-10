""""""""""""""""""
" Useful variables
""""""""""""""""""

let vimdir = '$HOME/.config/nvim'
if has("win32")
	let vimdir = '$HOME/AppData/Local/nvim/'
endif

""""""""""""""""""
" Vim configuration
""""""""""""""""""

" Syntax
filetype plugin indent on
syntax on
syntax enable

" Editor GUI
:set guifont=Consolas:h12
:set number
:set cursorline
:set showcmd
:set scrolloff=4

" Editor
:set noesckeys
:nnoremap <silent> <A-n> :set relativenumber! relativenumber?<CR>
:nnoremap <Leader>y "+y
:nnoremap <Leader>p "+p
:set laststatus=2

" Indentation
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set expandtab

" Search
:set wildmenu
:set incsearch
:set hlsearch
:nnoremap <silent> <space> :set hlsearch! hlsearch?<CR>

" Undo
if has('persistent_undo')
	let myundodir = expand(vimdir . '/undodir')
	" Create dirs
	if empty(glob(myundodir))
		call system('mkdir ' . vimdir)
		call system('mkdir ' . myundodir)
	endif
	let &undodir = myundodir
	:set undofile
	:set undolevels=1000
	:set undoreload=10000
endif

" Folding
:set foldenable
:set foldlevelstart=10
:set foldnestmax=10
:set foldmethod=indent

" File settings
" :set encoding=utf8
:set nobackup
:set backspace=indent,eol,start
:set fileformat=unix
:set fileformats=unix,dos

" Window Switching
:nnoremap <silent> <A-h> :wincmd h<CR>
:nnoremap <silent> <A-j> :wincmd j<CR>
:nnoremap <silent> <A-k> :wincmd k<CR>
:nnoremap <silent> <A-l> :wincmd l<CR>

" Remove trailing whitespace before saving buffer
autocmd BufWritePre * :%s/\s\+$//e

" Extra files
augroup filetype
	autocmd!
	" GLSL
	autocmd BufNewFile,BufRead *.vert,*.frag,*.tesc,*.tese,*.geom,*.comp set filetype=c
	" jflex
	autocmd BufNewFile,BufRead *.flex,*.jflex set filetype=jflex
	" Haskell
	autocmd BufNewFile,BufRead *.hamlet set filetype=html
	autocmd BufNewFile,BufRead *.lucius,*.cassius set filetype=css
	autocmd BufNewFile,BufRead *.julius set filetype=javascript

augroup END
autocmd Syntax jflex so $VIM/vimfiles/syntax/jflex.vim

""""""""""""""""""
" Plugins
""""""""""""""""""

" to sort plugins use :sort/.*\//
call plug#begin('~/.config/nvim/plugged')
Plug 'rking/ag.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'mattn/emmet-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'raichoo/purescript-vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
call plug#end()

" ag.vim

"deoplete.nvim
let g:deoplete#enable_at_startup = 1

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" haskell-vim

" jellybeans.vim
set background=dark
colorscheme jellybeans
set fillchars+=vert:│

" lightline.vim
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ 'active': {
	\ 	'left': [['mode', 'paste'], ['fugitive', 'filename', 'modified']]
	\ },
	\ 'component' : {
	\	'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	\ },
	\ 'component_visible_condition': {
	\	'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	\ }
	\ }

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" purescript-vim

" rainbow_parentheses.vim
nnoremap <A-p> :RainbowParentheses!!<CR>
augroup rainbow_lisp
  autocmd!
  autocmd FileType clojure,lisp,scheme RainbowParentheses
augroup END

" tabular

" tagbar
map <F8> :TagbarToggle<CR>

" vim-clojure-static
" vim-commentary
" vim-fireplace
" vim-cpp-enhanced-highlight

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-javascript
" vim-surround
