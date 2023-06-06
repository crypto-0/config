syntax on
autocmd VimEnter * if isdirectory(expand("<amatch>")) | exe 'FZF! '.expand("<amatch>") | endif

"omnifunc
set omnifunc=syntaxcomplete#Complete

"others
set termguicolors
set relativenumber
set number
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab 
set autoindent
filetype on 
filetype plugin on
filetype indent on
set complete+=kspell
set completeopt=menuone,longest
""set nowrap
set wrap 
set linebreak 
set nolist
set breakindent
""set tw=80
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set shortmess+=c
set shortmess+=w
"set shortmess+=F
set noshowcmd
set hidden
set clipboard=unnamedplus
set updatetime=300
set colorcolumn=80
"set cursorline
set noeb vb t_vb=
set vb t_vb =

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
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"


"add tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"noremap
inoremap jk <esc>

"leader key
let mapleader = ","

"add empty lines
nmap <leader>o o<esc>k
nmap <leader>O O<esc>j

"easy buffer navigation
nmap <silent> <leader>1 :b1<CR>
nmap <silent> <leader>2 :b2<CR>
nmap <silent> <leader>3 :b3<CR>
nmap <silent> <leader>4 :b4<CR>
nmap <silent> <leader>5 :b5<CR>
nmap <silent> <leader>6 :b6<CR>
nmap <silent> <leader>7 :b7<CR>
nmap <silent> <leader>8 :b8<CR>
nmap <silent> <leader>9 :b9<CR>
nmap <silent> <leader>0 :b0<CR>
nmap <silent> <leader># :b#<CR>


nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>> :resize +5<CR>
nnoremap <silent> <Leader>< :resize -5<CR>
set splitbelow
set splitright

"Colorscheme settings
colorscheme solarized8
autocmd vimenter * hi Normal guibg=NONE ctermbg =NONE
set background=dark
"autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
"autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg

"quick-scope settings
let g:qs_highlight_on_keys = ["f","F","t","T"]

"coc mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

"coc-extensions to be install all  at once
let g:coc_global_extensions = [
    \ "coc-pairs",
    \ "coc-html",
    \ "coc-css",
    \ "coc-json",
    \ "coc-emmet",
    \ "coc-pyright",
    \ "coc-java",
    \ "coc-tsserver"
    \ ]

"lightline setting
set laststatus=2
set noshowmode
let g:lightline ={
    \'colorscheme': 'solarized',
    \}


"set up fzf
set runtimepath^=~/.fzf
set runtimepath^=~/.vim/pack/fzf/start/fzf.vim
"nnoremap <C-p> :Files<Cr>
""nnoremap <C-p> :FZF<Cr>
nnoremap <C-p> :GFiles<Cr>
nnoremap <silent> <leader><Space> :Buffers<CR>
let g:fzf_preview_window = 'right:60%'

"set up emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global =0
autocmd FileType html,css,qss EmmetInstall
let g:user_emmet_settings = {
  \  'html' : {
  \    'indent_blockelement': 1,
  \  },
  \}
augroup filetypedetect
    au BufRead,BufNewFile *.qss set filetype=css
augroup END

"netrw setting
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
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
nmap <leader>r  <plug>NetrwRefresh
noremap <leader>e  :call ToggleNetrw()<cr>
"call ToggleNetrw()
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :call ToggleNetrw()
"augroup END
"inoremap <silent> <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"tmux_navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

"startify
 let g:startify_lists = [
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

 let g:startify_bookmarks = [
    \ { 'v': '~/.vimrc'},
    \ { 'z': '~/.config/zsh/.zshrc'},
    \ ]
 let g:startify_change_to_vcs_root = 1

 "markdown
 let g:vim_markdown_folding_disabled = 1
 let g:mkdp_refresh_slow=1
 let g:mkdp_markdown_css="/home/tae/documents/github-markdown-css"
 autocmd FileType markdown let conceallevel=0

 "vim-grepper
 let g:grepper={}
 let g:grepper.tools=["rg"]
 "omniserver
 let g:OmniSharp_server_use_mono = 1
 let g:OmniSharp_server_stdio = 0
 "let g:OmniSharp_server_path = "latest"
 "let g:OmniSharp_timeout = 5
 "let g:OmniSharp_server_use_net6 = 1
 "let g:OmniSharp_translate_cygwin_wsl = 1
