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
set grepprg=ack\ -k
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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers  = ['code_checker', 'issues', 'semantic']
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

autocmd VimLeave * silent !echo -ne "\033]112\007"
let &t_EI .= "\e[1 q"
let &t_SI .= "\e[5 q"
let &t_ti .= "\e[1 q"
let &t_te .= "\e[0 q"

" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap <F5> :UndotreeToggle<cr>

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    let &undodir = myUndoDir
    set undofile
endif
