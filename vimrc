call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'ryanss/vim-hackernews'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'reedes/vim-pencil'
Plug 'jamessan/vim-gnupg'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'vim-latex/vim-latex'
Plug 'scrooloose/syntastic'
Plug 'sudo.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'freitass/todo.txt-vim'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'deris/vim-shot-f'  " TODO may be clever-f ?
Plug 'kshenoy/vim-signature'
Plug 'henrik/vim-indexed-search'
Plug 'sjl/gundo.vim'
Plug 'elzr/vim-json'
Plug 'Raimondi/delimitMate'
Plug 'michaeljsmith/vim-indent-object'
"Plug 'bkad/CamelCaseMotion'

call plug#end()

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
set visualbell
set scrolloff=3         " minimum number of lines visible near above/below the cursor
set confirm		" confirm before :w :q and so on set autochdir set title 
set nobackup
set noswapfile
"set viminfo=
set noshowmode            " show current mode in the status line
set showcmd             " show a command while typing
set laststatus=2	" always show the status line
set undodir=~/.vim/undo " persistent-undo
set undofile            " store all persistent-undos in a file
set autowrite           " autosave buffer when it is hidden
set autowriteall        " autosave all buffers when switching
set shiftround          " round spaces number to shiftwidth
set title               " set window title to a filename
set clipboard=unnamedplus   " use X11 clipboard as unnamed register

set ttimeout
set ttimeoutlen=10

" show trailing whitespaces
set list
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

let mapleader = ","

cnoremap w!! w !sudo tee % >/dev/null

nnoremap ; :
nnoremap : ;
nnoremap <Enter> o<ESC>

nnoremap <Leader>w :w<CR>
"nnoremap <Esc><Esc> :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :b#<CR>
nnoremap <BS> :b#<CR>
nnoremap Q :!./%<CR>

nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprevious<CR>

" sane movements in wrap mode
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"TODO remap it somewhere (localleader?)
nmap <Leader>j <Plug>IMAP_JumpForward

nnoremap <Leader>n :e ~/notes/

nnoremap <Tab> <C-W>

nnoremap <Leader>4 :TagbarToggle<CR>
nnoremap <leader>3 :GundoToggle<CR>
nnoremap <leader>o :Explore<CR>
nnoremap <leader>v :e $MYVIMRC<CR>

nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>

inoremap <C-l> <C-r><C-p>+
" TODO: make a fallback to ack or even grep
nnoremap <Leader>/ :Ag 
nnoremap <Leader>\ :nohlsearch<CR>

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>ge :Gedit<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gc :Gcommit<cr>

" Use sane PCRE regexes.
nnoremap / /\v
vnoremap / /\v

" visual reselect of just pasted
nnoremap gp `[v`]

set pastetoggle=<C-b>

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
let g:airline#extensions#tabline#enabled = 1
let g:indentLine_char = "┆"

" highlight 80th column
if (exists('+colorcolumn'))
    "set colorcolumn=80
    highlight ColorColumn ctermbg=darkgrey
    call matchadd('ColorColumn', '\%81v', 100)
endif
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "1"

let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_python_pylint_args = '--extension-pkg-whitelist=numpy,scipy,sklearn,pandas'
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_aggregate_errors = 1

let g:EasyMotion_leader_key = '<Space>'
let g:vim_json_syntax_conceal = 0

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
