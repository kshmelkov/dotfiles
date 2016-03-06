if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Interface plugins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'henrik/vim-indexed-search'
Plug 'kshenoy/vim-signature'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
" Plug 'edkolev/promptline.vim'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" General functionality
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'simnalamburt/vim-mundo', {'on': 'GundoToggle'}
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-characterize'
Plug 'Raimondi/delimitMate'
Plug 'sudo.vim'
Plug 'romainl/vim-qf'
Plug 'mbbill/undotree'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim', {'do': 'make' }
" Plug 'Shougo/vimfiler.vim'

" IDE-like plugins
" Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'benekastah/neomake'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
" Plug 'thinca/vim-quickrun' "???

" Integration
Plug 'jamessan/vim-gnupg'
Plug 'szw/vim-g'
" Plug 'tmux-plugins/vim-tmux-focus-events'  " don't work on neovim
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
" Plug 'cazador481/fakeclip.neovim'  " should work, but...
Plug 'ledger/vim-ledger'

" Navigation
Plug 'justinmk/vim-sneak'
Plug 'rbonvall/vim-textobj-latex', {'for': 'tex'}
Plug 'bps/vim-textobj-python', {'for': 'python'}
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'glts/vim-textobj-comment'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tommcdo/vim-exchange'
Plug 'AndrewRadev/sideways.vim'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'bkad/CamelCaseMotion'

" Filetype plugins
" Plug 'jceb/vim-orgmode'
" Plug 'itchyny/calendar.vim'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'freitass/todo.txt-vim', {'for': 'todo'}
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
Plug 'tmux-plugins/vim-tmux'
" Plug 'JuliaLang/julia-vim', {'for': 'julia'}  " very strange bugs
" Plug 'fs111/pydoc.vim'
" Plug 'klen/python-mode'
" Plug 'altercation/vim-colors-solarized'
" Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

" let g:org_agenda_files=['~/org/todo.org', '~/org/calendar.org']

" Cosmetic changes
set shortmess+=I        " Disable welcome message
set t_Co=256            " 256 color terminal
let base16colorspace=256
set background=dark
colorscheme base16-3024
" colorscheme solarized
set visualbell          " visual X11 bell instead of audible bell
set title               " set window title to a filename
set lazyredraw          " don't redraw while executing macros and commands
set ttimeout
set ttimeoutlen=10
set fileencoding=utf-8
syntax sync minlines=256    " Update syntax highlighting for more lines increased scrolling performance
set synmaxcol=256           " Don't syntax highlight long lines
set splitbelow
set splitright
set nohlsearch

set infercase           " correct case during autocompletion
set nojoinspaces        " Use only 1 space after "." when joining lines instead of 2
set linebreak           " wrap by words
set breakindent         " indent wrapped lines
set nostartofline       " Don't reset cursor to start of line when moving around

" Indent related settings
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab           " expand Tab into number of spaces
set shiftround          " round spaces number to shiftwidth

" Search settings
set ignorecase
set smartcase		" case-sensitive search if a pattern has uppercase symbols
set gdefault		" default g flag in search replace

set nrformats=          " treat all numerals as decimal

" Interface settings
set mouse=n
set cursorline          " highlight current line
set scrolloff=3         " minimum number of lines visible near above/below the cursor
set ruler		" always show the cursor position
" set relativenumber      " relative numbering from the current line
set number		" line numbering
set showmatch           " show matching bracket after insertion
set noshowmode          " don't how current mode in the status line (there is airline for that)
set showcmd             " show a command while typing
set laststatus=2	" always show the status line
set list                " show trailing whitespaces
set listchars=tab:▸\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
set wrap " Enable wrapping
set showbreak=↪\  " Character to precede line wraps
set switchbuf=useopen   " Jump to the first open window that contains the specified buffer

" Persistence settings
set hidden		" don't abandon a hidden buffer
set autowrite           " autosave buffer when it is hidden
set autowriteall        " autosave all buffers when switching
set confirm		" confirm before :w :q and so on set autochdir set title
set nobackup
set nowritebackup
set noswapfile
set history=1000
set undodir=~/.vim/undo " persistent-undo
set undofile            " store all persistent-undos in a file

" set clipboard=unnamedplus   " use X11 clipboard as unnamed register

" set wildmode=full

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

" solve problem with cyrillic in Normal mode
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

""" Keybindings
let mapleader = "\<Space>"

cnoremap w!! w !sudo tee % >/dev/null

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Set <c-n> and <c-p> to act like Up/Down so will filter command history
" Practical Vim p.69
cnoremap <c-p> <up>
cnoremap <c-n> <down>

nnoremap <silent> <Esc> :up<CR>

nnoremap <Enter> :
xnoremap <Enter> :
" avoid conflicts with quickfix and command-line window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

" navigation between splits and terminals
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <A-j> :TmuxNavigateDown<CR>
nnoremap <silent> <A-k> :TmuxNavigateUp<CR>
nnoremap <silent> <A-l> :TmuxNavigateRight<CR>
" nnoremap <silent> <A-q> :TmuxNavigatePrevious<CR>

tnoremap <silent> <A-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <A-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <A-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <A-l> <C-\><C-n>:TmuxNavigateRight<CR>
" tnoremap <silent> <A-q> <C-\><C-n>:TmuxNavigatePrevious<CR>

nnoremap <Leader>< :SidewaysLeft<CR>
nnoremap <Leader>> :SidewaysRight<CR>

nnoremap <A-Tab> <C-W>
tnoremap <A-Tab> <C-\><C-n>

nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>s :set spell<CR>:set spelllang=
nnoremap <silent> <Leader>w :up<CR>
nnoremap <silent> <Leader>q :xa<CR>
nnoremap <silent> <Leader>x :Sayonara<CR>
nnoremap <BS> :FixWhitespace<CR>
nnoremap <Leader>r :!./%<CR>
nnoremap g/ :Google
nnoremap <Leader>g :Googlef 

" X11 clipboard mappings
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>d "+d
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P

nnoremap Y y$
nnoremap <F1> <nop>
inoremap <F1> <nop>

" toggle current and alternate buffers
nnoremap <Leader>a <c-^>
nnoremap <silent> <Leader><Leader> :up<CR>:Sayonara<CR>

nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprevious<CR>

" restore classical Q behaviour
nnoremap Q gqap
vnoremap Q gq

" un-wrap hard-wrapped text.
nnoremap <leader>j vipJ

" sane movements in wrap mode
noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap <Leader>n :e ~/org/
" TODO
" nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
" leader enter

nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>o :Explore<CR>
nnoremap <leader>v :e $MYVIMRC<CR>

" set working directory
nnoremap <leader>. :lcd %:p:h<CR>

inoremap <C-b> <C-r><C-p>+

let g:grepper = {
    \ 'tools':     ['ag', 'git', 'grep'],
    \ 'open':      1,
    \ 'switch':    1,
    \ 'jump':      0,
    \ 'next_tool': '<tab>',
    \ }
nnoremap <leader>/ :Grepper!<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

nnoremap <silent> <Leader>\ :nohlsearch<CR>

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>ge :Gedit<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gsh :Gpush<CR>
nnoremap <Leader>gll :Gpull<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gvdiff<CR>

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

nnoremap <Up> <C-W>+
nnoremap <Down> <C-W>-
nnoremap <Left> <C-W><
nnoremap <Right> <C-W>>

" nnoremap <S-Up> <C-W>K
" nnoremap <S-Down> <C-W>J
" nnoremap <S-Left> <C-W>H
" nnoremap <S-Right> <C-W>L

nnoremap <M-Up> <C-W>_
nnoremap <M-Down> <C-W>=
nnoremap <M-Left> <C-W>=
nnoremap <M-Right> <C-W><Bar>

" Disable arrow keys in insert mode
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>
inoremap <Left> <NOP>
inoremap <Down> <NOP>
inoremap <Up> <NOP>
inoremap <Right> <NOP>

" Use sane PCRE regexes.
nnoremap / /\v
vnoremap / /\v

" visual reselect of just pasted
" TODO very interesting default command
" nnoremap gp `[v`]

autocmd BufNewFile,BufReadPost /dev/shm/pass* set filetype=password
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost ~/notes/* set filetype=markdown
autocmd BufNewFile,BufReadPost ~/todo/* set filetype=todo

autocmd BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
	autocmd FileType todo         NoPencil
	autocmd FileType text         call pencil#init()
	autocmd FileType password     NoPencil
augroup END

augroup deoplete
        autocmd FileType text let b:deoplete_disable_auto_complete = 1
        autocmd FileType password let b:deoplete_disable_auto_complete = 1
        autocmd FileType mail let b:deoplete_disable_auto_complete = 1
augroup END

" autocmd VimLeave * call system("xsel -ib", getreg())

" LaTeX-related setting
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

let g:airline_theme = 'base16'
" let g:airline_theme = 'solarized'
let g:airline_section_x = '%{PencilMode()}'

" buffers as pseudo-tabs
let g:airline#extensions#tabline#enabled = 0
" display only filename in tab title
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tmuxline#enabled = 0

let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1
let g:tmuxline_theme = 'airline'
let g:tmuxline_preset = 'minimal'

let g:indentLine_char = "┆"

" let g:vim_fakeclip_tmux_plus=0

" let g:ctrlp_user_command = 'ag %s -i -l --nocolor -g ""'

" highlight 80th column
if (exists('+colorcolumn'))
    "set colorcolumn=80
    highlight ColorColumn ctermbg=darkgrey
    call matchadd('ColorColumn', '\%81v', 100)
endif

" python settings
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = "0"
" let g:jedi#auto_initialization = 0

let g:neomake_python_enabled_makers = ['python', 'pyflakes', 'pep8']  " flake8, pylint
let g:neomake_python_python_exe = '/usr/bin/python2'
autocmd! BufWritePost * Neomake

" let g:latex_to_unicode_tab = 0
" let g:latex_to_unicode_suggestions = 0
" let g:latex_to_unicode_auto = 0

let g:vim_json_syntax_conceal = 0

let g:sneak#streak = 1
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0

""" Neosnippets settings
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" TODO correct conceal for tex files
" For snippet_complete marker.
if has('conceal')
  set conceallevel=0
  set concealcursor=nc
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><Tab>  deoplete#mappings#manual_complete()

inoremap <expr><C-y>  deoplete#mappings#close_popup()
inoremap <expr><C-e>  deoplete#mappings#cancel_popup()

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>L :Lines<CR>
" TODO
" nnoremap <silent> <leader>o :BTags<CR>
" nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>: :Commands<CR>
nnoremap <silent> <leader>m :History<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>

imap <C-x><C-l> <plug>(fzf-complete-line)
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-j> <plug>(fzf-complete-file-ag)

" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)
