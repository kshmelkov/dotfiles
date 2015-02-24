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
Plugin 'ryanss/vim-hackernews'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'reedes/vim-pencil'
Plugin 'jamessan/vim-gnupg'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/syntastic'
Plugin 'sudo.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'freitass/todo.txt-vim.git'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'deris/vim-shot-f'
Plugin 'kshenoy/vim-signature'

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
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab           " expand Tab into number of spaces
set backspace=indent,eol,start  " correct backspace behaviour

set ignorecase
set smartcase		" case-sensitive search if a pattern has uppercase symbols
set t_Co=256            " 256 color terminal
let base16colorspace=256
colorscheme base16-3024
set background=dark
set ruler		" always show the cursor position
set relativenumber      " relative numbering from the current line
set number		" line numbering
set hlsearch		" highlight search string
set incsearch		" search while typing
set showmatch           " show matching bracket after insertion
set hidden		" don't abandon a hidden buffer
set autoread            " reread file changed outside
set gdefault		" default g flag in search replace
set mousehide
set history=1000
set noerrorbells
set scrolloff=3         " minimum number of lines visible near above/below the cursor
set confirm		" confirm before :w :q and so on set autochdir set title set nobackup
set noswapfile
"set viminfo=
set showmode            " show current mode in the status line
set showcmd             " show a command while typing
set laststatus=2	" always show the status line
set wildmenu
set undodir=~/.vim/undo " persistent-undo
set undofile            " store all persistent-undos in a file
set autowrite           " autosave buffer when it is hidden
set autowriteall        " autosave all buffers when switching

let mapleader = ","

nnoremap <Enter> o<ESC>

nnoremap <Leader>w :w<CR>
nnoremap <Esc><Esc> :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :b#<CR>
nnoremap <BS> :b#<CR>
nnoremap Q :!./%<CR>
nnoremap <Leader>s :w !sudo tee % > /dev/null

"nnoremap <Leader>j :bnext<CR>
"nnoremap <Leader>k :bprevious<CR>

nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprevious<CR>

nmap <Leader>j <Plug>IMAP_JumpForward

nnoremap <Leader>n :e ~/notes/

nnoremap <Tab> <C-W>
nnoremap <Leader>t :TagbarToggle<CR>

nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
" TODO: try to remove these keymappings
vmap <C-C> "+y
nmap <C-V> "+p

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

inoremap <C-v> <C-r><C-p>+
" TODO: make a fallback to ack or even grep
nnoremap <Leader>/ :Ag 
nnoremap <Leader>\ :nohlsearch<CR>

set pastetoggle=<F3>

set encoding=utf-8
set fileencoding=utf-8

augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
	autocmd FileType text         call pencil#init()
augroup END

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost ~/notes/* set filetype=markdown

autocmd VimLeave * call system("xsel -ib", getreg())

" set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:airline_theme = 'base16'
let g:airline_section_x = '%{PencilMode()}'
let g:indentLine_char = "┆"

" highlight 80th column
"if (exists('+colorcolumn'))
        "set colorcolumn=80
        ""highlight ColorColumn ctermbg=darkgrey
"endif
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "1"

let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_python_pylint_args = '--extension-pkg-whitelist=numpy,scipy,sklearn'
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_aggregate_errors = 1

let g:EasyMotion_leader_key = '<Space>'
