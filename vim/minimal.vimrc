"General options
set nocompatible           " Disable vi compatibility (emulation of old bugs)
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
"set backspace=indent,eol,start " Allow backspacing over everyting in INSERT mode


set hidden                 " Switch between buffers without having to save first.
set noswapfile             " Disable swap files
set nobackup               " Disable backup files

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set showmatch              " Highlight matching braces

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.


set listchars=eol:¬,tab:▸\ ,trail:· " Show invisible texts
set comments=sl:/*,mb:\ *,elx:\ */  " Smart comment
set textwidth =120         "Will auto wrap if text go beyong 120

set number
set relativenumber

colorscheme desert

let mapleader =" "           " maps leader key


"Better escape
inoremap jk <esc>

"Better resizing
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>> :resize +5<CR>
nnoremap <silent> <Leader>< :resize -5<CR>

"Better splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>q :q<CR>

"Better buffers
nnoremap [b :bprevious<CR>
nnoremap [B :bfirst<CR>
nnoremap ]b :bnext<CR>
nnoremap ]B :blast<CR>

"better tabs
nnoremap [t :tprevious<CR>
nnoremap [T :tfirst<CR>
nnoremap ]t :tnext<CR>
nnoremap ]T :tlast<CR>

"better quicklist
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]q :cnext<CR>
nnoremap ]Q :clast<CR>


"Better netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_altv = 1
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
noremap <leader>e  :call ToggleNetrw()<CR>

"set shape of cursorline
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
augroup resetCursorLine
au!
 "autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


" https://github.com/mhinz/vim-galore " Helpful vim info
