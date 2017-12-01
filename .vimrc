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
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

"" General
set number	" Show line numbers
set showmatch	" Highlight matching brace
set cursorline  "Highlight cursorline
highlight CursorLine   cterm=NONE ctermbg=black "cursorline highlight color

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

""colorscheme
" set t_Co=256
set termguicolors
colorscheme molokai


""map
let mapleader = '\'  " specifiy <Leader>
"tab move
nmap <C-h> gT<CR>
nmap <C-l> gt<CR>
"quickfix
nmap <C-j> :cn<CR>
nmap <C-k> :cp<CR>
" Plugin NERDTreeToggle open directory tree 
nnoremap <C-\> :NERDTreeToggle<CR>
"Plugin YouCompleteMe Goto defination (same as Pycharm)
nnoremap <C-b> :YcmCompleter GoTo<CR> 
"Plugin YouCompleteMe GetDoc
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
"Plugin YouCompleteMe GoToReferences
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
" Enable folding with the spacebar
nnoremap <space> za

""EasyMotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature 

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" <Leader>s{char}{label}
nmap <Leader>s <Plug>(easymotion-overwin-f)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"" YouCompleteMe configuration
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python3'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1


""Python PEP8
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

""html css js
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2 |

""flag unnecessary white space
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

