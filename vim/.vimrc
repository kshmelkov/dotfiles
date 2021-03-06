call plug#begin('~/.vim/plugged')

" Interface plugins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'henrik/vim-indexed-search'
Plug 'kshenoy/vim-signature'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'

" General functionality
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
" Plug 'reedes/vim-pencil'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim', {'do': 'make' }
" Plug 'sudo.vim'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" IDE-like plugins
" Plug 'davidhalter/jedi-vim'
" Plug 'Shougo/neocomplete.vim'
" Plug 'honza/vim-snippets'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'scrooloose/syntastic'
" Plug 'ludovicchabant/vim-lawrencium'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'

" Integration
Plug 'jamessan/vim-gnupg'
Plug 'tmux-plugins/vim-tmux'
Plug 'szw/vim-g'

" Navigation
Plug 'justinmk/vim-sneak'
Plug 'rbonvall/vim-textobj-latex', {'for': 'tex'}
Plug 'bps/vim-textobj-python', {'for': 'python'}
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'glts/vim-textobj-comment'
Plug 'jeetsukumaran/vim-indentwise'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'bkad/CamelCaseMotion'

" Filetype plugins
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
Plug 'altercation/vim-colors-solarized'

" Plug 'Shougo/vimficer.vim'
Plug 'edkolev/tmuxline.vim'

call plug#end()

" Cosmetic changes
set shortmess+=I        " Disable welcome message
set t_Co=256            " 256 color terminal
" let base16colorspace=256
" colorscheme base16-3024
colorscheme solarized
set background=dark
set visualbell          " visual X11 bell instead of audible bell
set title               " set window title to a filename
set ttyfast             " fast terminal redraw
set lazyredraw          " don't redraw while executing macros and commands
set ttimeout
set ttimeoutlen=10
set encoding=utf-8
set fileencoding=utf-8
syntax sync minlines=256    " Update syntax highlighting for more lines increased scrolling performance
set synmaxcol=256           " Don't syntax highlight long lines

set infercase           " correct case during autocompletion
set nojoinspaces        " Use only 1 space after "." when joining lines instead of 2
set linebreak           " wrap by words
set breakindent         " indent wrapped lines
set nostartofline       " Don't reset cursor to start of line when moving around

" Indent related settings
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab           " expand Tab into number of spaces
set shiftround          " round spaces number to shiftwidth

" Search settings
set ignorecase
set smartcase		" case-sensitive search if a pattern has uppercase symbols
set hlsearch		" highlight search string
set incsearch		" search while typing
set gdefault		" default g flag in search replace

set backspace=indent,eol,start  " correct backspace behaviour
set nrformats=          " treat all numerals as decimal

" Interface settings
set cursorline          " highlight current line
set scrolloff=3         " minimum number of lines visible near above/below the cursor
set ruler		" always show the cursor position
set relativenumber      " relative numbering from the current line
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
set autoread            " reread file changed outside
set autowrite           " autosave buffer when it is hidden
set autowriteall        " autosave all buffers when switching
set confirm		" confirm before :w :q and so on set autochdir set title 
set nobackup
set nowritebackup
set noswapfile
set history=1000
set undodir=~/.vim/undo " persistent-undo
set undofile            " store all persistent-undos in a file

if has ('unnamedplus')
    set clipboard=unnamedplus   " use X11 clipboard as unnamed register
else
    set clipboard=unnamed
endif

" Wildmenu
set wildmenu
set wildmode=full

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

nnoremap <Enter> :
" avoid conflicts with quickfix and command-line window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


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

" Toggle current and alternate buffers
" nnoremap <leader><leader> <c-^>
nnoremap <silent> <Leader><Leader> :up<CR>:Sayonara<CR>

nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprevious<CR>

" restore classical Q behaviour
nnoremap Q gqap
vnoremap Q gq

" sane movements in wrap mode
noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap <Leader>n :e ~/org/

" nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>o :Explore<CR>
nnoremap <leader>v :e $MYVIMRC<CR>

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

" nnoremap <Leader>f :CtrlP<CR>
" nnoremap <Leader>b :CtrlPBuffer<CR>
" nnoremap <Leader>m :CtrlPMRUFiles<CR>

inoremap <C-b> <C-r><C-p>+
" TODO: make a fallback to ack or even grep
nnoremap <Leader>/ :Ag 
nnoremap <Leader>\ :nohlsearch<CR>

" Un-wrap hard-wrapped text.
nnoremap <leader>j vipJ

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>ge :Gedit<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>gc :Gcommit<cr>

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

" Disable arrow keys in normal mode and insert mode
noremap <Left> <NOP>
noremap <Down> <NOP>
noremap <Up> <NOP>
noremap <Right> <NOP>
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>
inoremap <Left> <NOP>
inoremap <Down> <NOP>
inoremap <Up> <NOP>
inoremap <Right> <NOP>

" Use sane PCRE regexes.
nnoremap / /\v
vnoremap / /\v

" visual reselect of just pasted
nnoremap gp `[v`]

set pastetoggle=<Leader>P

" augroup pencil
" 	autocmd!
" 	autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
" 	autocmd FileType todo call pencil#init({'wrap': 'soft'})
" 	autocmd FileType text         call pencil#init()
"         " autocmd FileType text         NeoCompleteLock
" augroup END

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost ~/notes/* set filetype=markdown
autocmd BufNewFile,BufReadPost ~/todo/* set filetype=todo

autocmd VimLeave * call system("xsel -ib", getreg())

" LaTeX-related setting
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

let g:airline_theme = 'solarized'
" let g:airline_section_x = '%{PencilMode()}'
" buffers as pseudo-tabs
let g:airline#extensions#tabline#enabled = 1
" display only filename in tab title
let g:airline#extensions#tabline#fnamemod = ':t'

let g:indentLine_char = "┆"

let g:ctrlp_user_command = 'ag %s -i -l --nocolor -g ""'

" highlight 80th column
if (exists('+colorcolumn'))
    "set colorcolumn=80
    highlight ColorColumn ctermbg=darkgrey
    call matchadd('ColorColumn', '\%81v', 100)
endif

" python settings
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#auto_initialization = 0

let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_python_pylint_args = '--extension-pkg-whitelist=numpy,scipy,sklearn,pandas'
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_aggregate_errors = 1

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

" """ Neocomplete settings
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" " WTF?
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()

" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif

" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif

" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:neocomplete#force_omni_input_patterns.python =
" \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" " alternative pattern: '\h\w*\|[^. \t]\.\w*'

" """ Neosnippets settings
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" " For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2
"   set concealcursor=nc
" endif
