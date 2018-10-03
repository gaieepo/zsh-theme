set nocompatible              " be iMproved, required

if filereadable(expand("~/.vim/plugins.vim"))
    so ~/.vim/plugins.vim
endif

syntax enable

set backspace=indent,eol,start
set complete=.,w,b,u,U
let mapleader = ',' " leader reset
let g:mapleader = ','

set showmode
set ruler
set number
set mouse=a
set showcmd
set nowrap
set autowriteall

set wildignore=*.exe,*.pyc


"-----Indent-----"
set smarttab
set autoindent

set tabstop=4 " (insert mode) a tab is four spaces
set expandtab
set softtabstop=4 " (insert mode)
set shiftwidth=4 " (normal mode) shift>> autoindent


"-----Visuals-----"
colorscheme atom-dark-256
" set background=dark
" set t_CO=256
" if has("gui_running")
"     set macligatures
" endif
" set guifont=Roboto_Mono:h14
" set linespace=2

set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T
set guioptions-=r

" split border
hi vertsplit guifg=bg guibg=bg

" highlight after 80 columns
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/


"-----Search-----"
set ignorecase
set smartcase
set hlsearch
set incsearch


"-----Bell-----"
set noerrorbells visualbell t_vb=


"-----Split Management-----"
set splitbelow
set splitright
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <silent> <Leader>h <C-W>10<
nmap <silent> <Leader>l <C-W>10>
nmap <silent> <Leader>= <C-W>=


"-----Mappings-----"
imap jj <Esc>
nmap <Leader>w :w!<cr>
nmap <Leader>wq :wq<cr>
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>plugin :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>cd :cd %:p:h<cr>:pwd<cr> " Auto change directory to match current file ,cd

" NerdTree
" >>>> GUI
nmap <D-1> :NERDTreeToggle<cr>
" <<<< GUI
nmap <Leader>1 :NERDTreeToggle<cr>

" Tab related
" >>>> GUI
nmap <C-Tab> gt
nmap <C-S-Tab> gT
" <<<< GUI
nmap <C-n> :tabe<cr>
nmap <Leader>t :tabe<cr>
nmap <Leader>n gt
nmap <Leader>p gT


"-----Sort Lines According to Length-----"
vmap <Leader>sort ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"-----Plugins-----"
"===NERDTree==="
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"===indentLine==="
let g:indentLine_enabled = 1


"-----Remove trailing space and lines-----"
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()"
autocmd BufWritePre * :call TrimEndLines()


"-----Auto-Commands-----"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
