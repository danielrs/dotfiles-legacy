" ----------------
" Setting up vimdir
" ----------------

let vimdir = '$HOME/.config/nvim'
if !has("nvim") && !has("win32")
  let vimdir = '$HOME/.vim'
elseif has("nvim") && has("win32")
  let vimdir = '$HOME/AppData/Local/nvim'
elseif !has("nvim") && has("win32")
  let vimdir = '$HOME/vimfiles'
endif

" ----------------
" GVim configuration
" ----------------

if !has('nvim') && has('gui_running')
  "set guifont=Consolas:h12
  set guifont=Source\ Code\ Pro\ 12
  set guioptions-=m "remove menu
  set guioptions-=T "remove toolbar
  set guioptions-=r "remove right scroll bar
  set guioptions-=L "remove left scroll bar
endif

" ----------------
" Vim configuration
" ----------------

set encoding=utf8

" syntax
filetype plugin indent on
syntax on
syntax enable

" editor UI
set guicursor=
set number
set cursorline
set showcmd
set scrolloff=4 " Always n lines visible when scrolling

" nvim/vim mismatch of esc keys
if !has('nvim')
  set noesckeys " Disable Esc-key escape sequences
endif

" relative numbers
nnoremap <silent> <A-n> :set relativenumber! relativenumber?<CR>
nnoremap <silent> <Esc>n :set relativenumber! relativenumber?<CR>

" copy and paste from system clipboard
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent

" search
set wildmenu
set incsearch
set hlsearch
nnoremap <silent> <space> :set hlsearch! hlsearch?<CR>
set showmatch

" undo
if has('persistent_undo')
  let myundodir = expand(vimdir . '/undodir')
  " create undo dirs
  if empty(glob(myundodir))
	  call system('mkdir ' . vimdir)
	  call system('mkdir ' . myundodir)
  endif
  let &undodir = myundodir
  set undofile
  set undolevels=1000 " max number of changes that can be undone
  set undoreload=10000 " mx number of changes to save on buffer reload
endif

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" file settings
set backspace=indent,eol,start
set fileformat=unix
set fileformats=unix,dos

" no backups (most stuff is using version control anyways)
set nobackup
set nowb
set noswapfile

" window Switching
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

nnoremap <silent> <Esc>k :wincmd k<CR>
nnoremap <silent> <Esc>j :wincmd j<CR>
nnoremap <silent> <Esc>h :wincmd h<CR>
nnoremap <silent> <Esc>l :wincmd l<CR>

" remove trailing whitespace before saving buffer
autocmd BufWritePre * :%s/\s\+$//e

" extra files
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

" ----------------
" Plugins
" ----------------

" to sort plugins use :sort/.*\//
call plug#begin('~/.config/nvim/plugged')
Plug 'rking/ag.vim'
Plug 'chriskempson/base16-vim'
Plug 'mattn/emmet-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'othree/html5.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'

if has('nvim')
  Plug 'zchee/deoplete-go'
  Plug 'zchee/deoplete-jedi'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/neocomplete.vim'
endif

call plug#end()

" Neovim and Vim plugins
" ----------------

" ag.vim

" base16-vim
set background=dark
set fillchars+=vert:│
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" disables opaque background
hi Normal ctermbg=none
hi NonText ctermbg=none

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,eelixir EmmetInstall

" haskell-vim
" html5.vim

" lightline.vim
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ }
set laststatus=2

" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" rainbow_parentheses.vim
nnoremap <A-p> :RainbowParentheses!!<CR>
nnoremap <Esc>p :RainbowParentheses!!<CR>
augroup rainbow_lisp
  autocmd!
  autocmd FileType clojure,lisp,scheme RainbowParentheses
augroup END

" rust.vim
let g:rustfmt_autosave = 1

" tabular

" tagbar
map <F8> :TagbarToggle<CR>

" vim-commentary
" vim-cpp-enhanced-highlight
" vim-elixir
" vim-go
" vim-javascript

" vim-less
" vim-python-pep8-indent'
" vim-sleuth
" vim-surround
" vimtex

" Neovim plugins
" ----------------

"deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

"deoplete-jedi
let g:deoplete#sources#jedi#extra_path = [getcwd()] "current dir venv

"deoplete.nvim
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Vim plugins
" ----------------

"neocomplete.vim
let g:neocomplete#enable_at_startup = 1
