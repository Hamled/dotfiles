" Pathogen setup
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" BEHAVIOR
" ==============
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set wildmenu
set wildmode=full
set autochdir
set hidden

set backspace=indent,eol,start

" if a buffer is already open in another window or tab,
" focus that win/tab instead of loading it again in the
" current window/tab
set switchbuf=useopen,usetab

syntax on
filetype on
filetype plugin on
set splitright
set splitbelow

" Indentation
set tabstop=4
set shiftwidth=4
set autoindent
filetype indent on

" But don't auto-continue comments
set formatoptions=cql

" Folding
set foldmethod=indent
set foldlevel=99
autocmd FileType xml setlocal foldmethod=syntax

set tags=tags;/

" Save tempfiles to the temp folder, duh
if has('unix')
    set dir=/var/tmp//
else
    set dir=$TEMP
endif

" Don't prompt me to reload files that only changed RO
autocmd FileChangedRO * echohl WarningMsg | echo "File changed RO." | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None

" File types
autocmd BufNewFile,BufRead *.boo setf boo

" Tab completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

if &diff
	set number
	set nowrap
endif

" APPEARANCE
" ==============

set bg=dark
" Status bar
set laststatus=2
set statusline=%#error#	" todo color
set statusline+=%F		"filename
set statusline+=\ %*	" normal color
set statusline+=\ %h	"help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%{fugitive#statusline()} " git branch
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P\   "percent through file
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format

" PLUGIN OPTIONS
" ==============

" FUNCTIONS
" =============

function! Mosh_Flip_Ext()
  " Switch editing between .c* and .h* files (and more).
  " Since .h file can be in a different dir, call find.
  if match(expand("%"),'\.c') > 0
    let s:flipname = substitute(expand("%"),'\.c\(.*\)','.h',"")
    exe ":find " s:flipname
  elseif match(expand("%"),"\\.h") > 0
    let s:flipname = substitute(expand("%"),'\.h\(.*\)','.cpp',"")
    exe ":e " s:flipname
  endif
endfun


" COMMANDS
" =============
let mapleader = ","

" Built-in commands
nmap <silent> <Leader>n :set number!<CR>
nmap <silent> <Leader>w :set wrap!<CR>
nmap <silent> <Leader>/ :noh<CR>
nmap <silent> <Leader><TAB> :e#<CR>

" Function commands
nmap <silent> <Leader>h :call Mosh_Flip_Ext()<CR>

" Plugin commands
nmap <silent> <Leader>g :GundoToggle<CR>
nmap <silent> <Leader>ut :call MakeGreen()<CR>
nmap <silent> <Leader>lt <Plug>TaskList
map <silent> <Leader>j :RopeGotoDefintion<CR>
map <silent> <Leader>r :RopeRename<CR>

let g:pep8_map='<Leader>8' " PEP8 python syntax plugin

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap <silent> <Leader>f <Esc>:Ack!

if &diff
	nnoremap <C-[> :qa<CR>
	nmap <F7> [c
	nmap <F8> ]c
endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
