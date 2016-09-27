" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

execute pathogen#infect()
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
set laststatus=2
set updatetime=750
set ttimeoutlen=50
set breakindent
set breakindentopt=sbr
set showbreak=└>\
let mapleader=" "

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

if has('gui_running')
    call gitgutter#disable()
endif

if has("gui_running") == 0
    set shell=/bin/bash
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hardwicke'
let g:airline#extensions#whitespace#enabled = 0

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_cache_dir = "~/.cache/ctrlp"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader><c-p> <Esc>:CtrlP<CR>

set commentstring=//%s

" An ugly hack to get this to load for vim but NOT for vsvim
" (because operator-flashy doesn't work with vsvim)
if version > 700
    map y <Plug>(operator-flashy)
    nmap Y <Plug>(operator-flashy)$
    " Have j and k work nicer with word wrapping
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
endif

nnoremap <F5> :UndotreeToggle<cr>

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    let &undodir = myUndoDir
    set undofile
endif

nnoremap <Leader>hi :set hlsearch<CR>:let @/='<C-r><C-w>'<CR>
"nnoremap <esc> :noh<cr><esc>

" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W
