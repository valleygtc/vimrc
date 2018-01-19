set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'easymotion/vim-easymotion'
Plugin 'Townk/vim-autoclose'
Plugin 'alvan/vim-closetag'
Plugin 'Valloric/MatchTagAlways'
Plugin 'sheerun/vim-polyglot'

Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line


"" General
set number	" Show line numbers
set showmatch	" Highlight matching brace
set cursorline  "Highlight cursorline
highlight CursorLine   cterm=NONE ctermbg=black "cursorline highlight color
set mouse=a

"search 
set hlsearch    " Highlight search results
set incsearch   " Makes search act like search in modern browsers
set ignorecase  " Ignore case when searching
set smartcase   " When searching try to be smart about cases 
 
"indent 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

set encoding=utf-8	"Set utf-8 as default encoding
 
set ruler	" Show row and column ruler information
syntax enable	"Enable syntax highlighting

" Enable folding
set foldmethod=indent
set foldlevel=99

"Ex <tab> autocomplete config
set wildmenu
set wildmode=full

""colorscheme
" set t_Co=256
set termguicolors
colorscheme molokai

if has("gui_running")
    if has("gui_gtk2")
	:set guifont=Mono\ 12 
    elseif has("x11")
	" Also for GTK 1
	:set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
	:set guifont=Luxi_Mono:h12:cANSI
    endif
endif


""map
let mapleader = " "  " specifiy <Leader>
"tab move
nmap <C-h> gT<CR>
nmap <C-l> gt<CR>

"quickfix
nmap <C-j> :cn<CR>
nmap <C-k> :cp<CR>

"toggle code folding
nnoremap <Leader>z za

"Plugin NERDTreeToggle open directory tree 
nnoremap <C-\> :NERDTreeToggle<CR>

""Plugin NERDCommenter toggle comment
map <C-_> <plug>NERDCommenterToggle

""(built-in)Plugin netrw configure
" let g:netrw_banner = 0
let g:netrw_liststyle = 3

""Plugin EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature 
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" <Leader>s{char}{label}
nmap <Leader>s <Plug>(easymotion-overwin-f)
"Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""Plugin YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python3'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"Goto defination (same as Pycharm)
nnoremap <C-b> :YcmCompleter GoTo<CR> 
"GetDoc
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
"GoToReferences
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
" cnacel the default <TAB> cycle for UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"Plugin ultisnippet
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"


""html css js
autocmd BufNewFile,BufRead *.html,*.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2 |

""flag unnecessary white space
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
