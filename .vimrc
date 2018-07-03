" Put plugins and dictionaries in this dir (also on Windows)
"let vimDir = '$HOME/.vim'
"let &runtimepath.=','.vimDir

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
call plug#end()

syntax on
filetype plugin indent on
set background=dark
colorscheme solarized
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
set clipboard=unnamed
set nrformats-=octal
set wildmenu
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=0
set updatetime=750
set ttimeoutlen=50
set breakindent
set breakindentopt=sbr
set showbreak=└>\
set lazyredraw
set softtabstop=4
set showmatch
let mapleader=" "


vnoremap < <gv
vnoremap > >gv

if has('gui_running')
    call gitgutter#disable()
endif

set commentstring=//%s

" An ugly hack to get this to load for vim but NOT for vsvim
" (because operator-flashy doesn't work with vsvim)
if version > 700
    map y <Plug>(operator-flashy)
    nmap Y <Plug>(operator-flashy)$

    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
endif

if has('persistent_undo')
    let myUndoDir = '~/.vim/undodir'
    " Create dirs
    let &undodir = myUndoDir
    set undofile
endif

nnoremap <Leader>hi :set hlsearch<CR>:let @/='<C-r><C-w>'<CR>
