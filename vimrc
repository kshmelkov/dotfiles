set nocompatible

" language messages en

syntax on               " включить подсветку синтаксиса.
set nowrap              " не разрывать строку
"set backup              " создавать .bak файлы (по умолчанию <oldname>~)
"set backupdir=~/.vim/backup
set autoindent          " установить автоотступ
set smartindent 	" умные отступы
set smarttab		" отступы в начале строки по Tab
" colorscheme blue	" меням цветовую схему
" set t_Co = 256
" colorscheme desert256
" colorscheme anotherdark
let base16colorspace=256
colorscheme base16-default
set background=dark
set ruler		" показывать положение курсора всегда
set number		" нумерация строк
set hlsearch 		" при поиске помечать все найденные строки
set incsearch		" поиск по набору
set showmatch 		" проверка скобок
set hidden 		" не выгружать буфер при переключении
set gdefault
set mousehide
set history=1000
set noerrorbells
set ignorecase
set smartcase
set scrolloff=3
set shortmess=atI
set confirm
set autochdir
set title
set nobackup
set noswapfile
set viminfo=
set noeb vb t_vb=

filetype plugin on
filetype indent on

let mapleader = ","
map <F12> <leader>be


command R !./%
map <F2> :w<CR>
map <F5> :R<CR>

set backspace=2

"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

"nmap <C-D> :s/$/\=strftime("%c")<CR>:noh<CR>$a<CR><CR><Esc>
"imap <C-D> <Esc>:s/$/\=strftime("%c")<CR>:noh<CR>$a<CR><CR>

nmap <C-S> :w!<CR>
imap <C-S> <Esc>:w!<CR>a

nmap <F10> :qa<CR>
imap <F10> <Esc>:qa<CR>

" nmap <Space> <PageDown>
" nmap <S-Space> <PageUp>

" copy-paste в глобальный clipboard
" vmap <C-C> "+yi
" vmap <C-V> <Esc>"+gPi

vmap <C-C> "+y
nmap <C-V> "+p
set pastetoggle=<F3>
inoremap <C-v> <C-r><C-p>+

"vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
"nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

set encoding=utf-8
set fileencoding=utf-8
"set termencoding=utf-8

"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=%<%F%h%m%r%y%=[BUF=%n]\ [%{&fileformat}]\ [%{&fileencoding}]\ %l,%c%V\ %P"\ %{strftime(\"%d.%m.%y\ -\ %H:%M\")}
set laststatus=2

set showmode

"<F11> - вызов меню выбора колировки 
" переключение в меню с помощью Tab 
" Меню выбора кодировки 
set wildmenu 
set wcm=<Tab> 
menu Encoding.utf-8 :e ++enc=utf-8 <CR> 
menu Encoding.utf-16 :e ++enc=utf-16 <CR>
menu Encoding.windows-1251 :e ++enc=cp1251 <CR> 
menu Encoding.latin1 :e ++enc=latin1 <CR> 
menu Encoding.iso-8859-5 :e ++enc=iso-8859-5 <CR> 
menu Encoding.cp-866 :e ++enc=cp866 <CR> 
menu Encoding.koi8-r :e ++enc=koi8-r <CR> 
map <F11> :emenu Encoding.<TAB>

if has ("autocmd")
"    au!
"    syntax on
    
    au VimEnter   *.txt set textwidth=0 wrap linebreak
    " set wrap for emails at 70, but source code doesn't wrap
    au BufRead   ae*.txt set textwidth=70
    au VimEnter  ae*.txt set lines=36
    "au BufEnter  ae*.txt startinsert
    au BufEnter  ae*.txt set textwidth=70
    au BufLeave  ae*.txt set textwidth=0
    " don't want to expand tabs for makefiles or greenhills build files
    "au BufRead   makefile,*.bld set noexpandtab
    "au BufEnter  makefile,*.bld set noexpandtab
    "au BufLeave  makefile,*.bld set expandtab
    " short width stuff for CVS checkins, so that the edit history
    " doesn't wrap in $Log
    "au BufRead   c:/temp/[0-9]\+ set textwidth=70
    "au VimEnter  c:/temp/[0-9]\+ set lines=20
    "au BufEnter  c:/temp/[0-9]\+ set textwidth=70
    "au BufEnter  c:/temp/[0-9]\+ startinsert
    "au BufLeave  c:/temp/[0-9]\+ set textwidth=0
endif

if has ("autocmd")
    " vim -b : edit binary using xxd-format!
    augroup Binary
    au BufReadPre  *.bin,*.exe,*.out,*.doc let &binary=1
    au BufReadPost * if &binary | %!xxd
    au BufReadPost * so $VIMRUNTIME/syntax/xxd.vim | set filetype=xxd | endif
    au BufWritePre * if &binary | %!xxd -r
    au BufWritePre * endif
    augroup END

    " read in the explorer macro file.
    "so $VIM/syntax/jtecmods/explorer.vim
    "so $VIM/syntax/jtecmods/browse.vim
endif

autocmd VimLeave * call system("xsel -ib", getreg())

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
