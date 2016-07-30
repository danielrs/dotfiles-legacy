""""""""""""""""""
" Useful variables
""""""""""""""""""

let vimdir = '$HOME/.config/nvim'
if !has("nvim") && !has("win32")
  let vimdir = '$HOME/.vim'
elseif has("nvim") && has("win32")
  let vimdir = '$HOME/AppData/Local/nvim'
elseif !has("nvim") && has("win32")
  let vimdir = '$HOME/vimfiles'
endif

""""""""""""""""""
" GVim configuration
""""""""""""""""""

if !has('nvim') && has('gui_running')
  :set guioptions-=m "remove menu
  :set guioptions-=T "remove toolbar
  :set guioptions-=r "remove right scroll bar
  :set guioptions-=L "remove left scroll bar
  ":set visualbell
  ":set t_vb= "" Disable Bell
endif

""""""""""""""""""
" Vim configuration
""""""""""""""""""

:set encoding=utf8

" Syntax
filetype plugin indent on
syntax on
syntax enable

" Editor GUI
:set guifont=Consolas:h12
:set number
:set cursorline
:set showcmd
:set scrolloff=4 " Always n lines visible when scrolling

" Editor
:set noesckeys " Disable Esc-key escape sequences
:nnoremap <silent> <A-n> :set relativenumber! relativenumber?<CR>
:nnoremap <silent> <Esc>n :set relativenumber! relativenumber?<CR>
:nnoremap <Leader>y "+y
:nnoremap <Leader>p "+p

" Indentation
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab

" Search
:set wildmenu
:set incsearch
:set hlsearch
:nnoremap <silent> <space> :set hlsearch! hlsearch?<CR>

if !has('nvim')
  :set showmatch
endif

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
	:set undolevels=1000 " Maximum number of changes that can be undone
	:set undoreload=10000 " Maximum number of lines to save for undo on a buffer reload
endif

" Folding
:set foldenable
:set foldlevelstart=10
:set foldnestmax=10
:set foldmethod=indent

" File settings
:set nobackup
:set backspace=indent,eol,start
:set fileformat=unix
:set fileformats=unix,dos

" Window Switching
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

nnoremap <silent> <Esc>k :wincmd k<CR>
nnoremap <silent> <Esc>j :wincmd j<CR>
nnoremap <silent> <Esc>h :wincmd h<CR>
nnoremap <silent> <Esc>l :wincmd l<CR>

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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-fireplace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
elseif !has('nvim')
  Plug 'Shougo/neocomplete.vim'
endif

call plug#end()

" Neovim and Vim plugins
""""""""""""""""""

" ag.vim

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,eelixir EmmetInstall

" haskell-vim

" jellybeans.vim
set background=dark
colorscheme jellybeans
set fillchars+=vert:│
hi Normal ctermbg=none
hi NonText ctermbg=none

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
:set laststatus=2

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" purescript-vim

" rainbow_parentheses.vim
nnoremap <A-p> :RainbowParentheses!!<CR>
nnoremap <Esc>p :RainbowParentheses!!<CR>
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
" vim-elixir

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-javascript
" vim-less
" vim-sleuth
" vim-surround

" Neovim plugins
""""""""""""""""""

"deoplete.nvim
let g:deoplete#enable_at_startup = 1


" Vim plugins
""""""""""""""""""

" neocomplete
let g:neocomplete#enable_at_startup = 1

