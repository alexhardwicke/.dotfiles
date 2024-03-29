call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'timakro/vim-searchant'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'alfredodeza/khuno.vim'
Plug 'RRethy/vim-illuminate'
Plug 'vim-airline/vim-airline'
Plug 'alexhardwicke/vim-airline-hardwicke'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

syntax on
filetype plugin indent on
colorscheme solarized
set background=dark

"let g:solarized_termcolors=256
let g:solarized_termtrans =1
"let g:solarized_hitrail   =1

set ruler
set number
set relativenumber
set ignorecase
set hlsearch
set incsearch
set encoding=utf8
set termencoding=utf8
set t_Co=256
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set nrformats-=octal
set wildmenu
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
set updatetime=750
set ttimeoutlen=50
set breakindent
set breakindentopt=sbr
set showbreak=└>\
set lazyredraw
set softtabstop=4
set showmatch
set mouse=a
set splitbelow
set splitright
let mapleader=" "
let python_highlight_all=1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hardwicke'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled=0

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

vnoremap < <gv
vnoremap > >gv

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    call gitgutter#disable()
endif

set commentstring=//%s

" An ugly hack to get this to load for vim but NOT for vsvim
" (because various things don't work with vsvim)
if version > 700
    set clipboard=unnamed

    map y <Plug>(operator-flashy)
    nmap Y <Plug>(operator-flashy)$

    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif

if has('persistent_undo')
    let myUndoDir = '~/.vim/undodir'
    " Create dirs
    let &undodir = myUndoDir
    set undofile
endif

nnoremap <Leader>hi :set hlsearch<CR>:let @/='<C-r><C-w>'<CR>
