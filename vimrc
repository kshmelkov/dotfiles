set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'reedes/vim-pencil'
Plugin 'jamessan/vim-gnupg'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'


" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

syntax on

set autoindent 
set smartindent
set smarttab
set ignorecase
set smartcase		" case-sensitive search if a pattern has uppercase symbols
set t_Co=256
let base16colorspace=256
colorscheme base16-default
set background=dark
set ruler		" always show the cursor position
set number		" line numbering
set hlsearch		" highlight search string
set incsearch		" search while typing
set showmatch
set hidden		" don't abandon a hidden buffer
set gdefault		" default g flag in search replace
set mousehide
set history=1000
set noerrorbells
set scrolloff=3
set confirm		" confirm before :w :q and so on
set autochdir
set title
set nobackup
set noswapfile
set viminfo=
set showmode
set laststatus=2	" always show the status line
set wildmenu

let mapleader = ","
map <F12> <leader>be

nmap <C-S> :w!<CR>
imap <C-S> <Esc>:w!<CR>a

nmap <F10> :qa<CR>
imap <F10> <Esc>:qa<CR>

vmap <C-C> "+y
nmap <C-V> "+p
inoremap <C-v> <C-r><C-p>+
	
set pastetoggle=<F3>

set encoding=utf-8
set fileencoding=utf-8

augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init()
	autocmd FileType text         call pencil#init()
augroup END

autocmd VimLeave * call system("xsel -ib", getreg())

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:airline_theme = 'base16'
