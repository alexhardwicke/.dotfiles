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
let mapleader=" "

if has("gui_running") == 0
    set shell=/bin/bash
endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hardwicke'
let g:airline#extensions#whitespace#enabled = 0

let g:ctrlp_open_multiple_files = 't'

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1

" An ugly hack to get this to load for vim but NOT for vsvim
" (because operator-flashy doesn't work with vsvim)
if version > 700
    map y <Plug>(operator-flashy)
    nmap Y <Plug>(operator-flashy)$
endif

if has('gui_running')
    call gitgutter#disable()
endif

nnoremap <F5> :UndotreeToggle<cr>

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    let &undodir = myUndoDir
    set undofile
endif

function CreateProperty()
    normal! 0
    if getline('.')[col('.')-1] == ' '
        normal! w
    endif
    normal! "hdt l"jdw$
    let type = @h
    let name = @j
    let @h = "public " . type . " " . name . " { get; set; }"
    normal! "hp
    normal! V=j
endfunction

function CreateNonAutoProperty(useSetProperty)
    let currLine = line('.')
    let bottomLine = currLine + 11
    normal! 0
    if getline('.')[col('.')-1] == ' '
        normal! w
    endif
    normal! "hdt l"jdwo
    let type = @h
    let name = @j
    normal! "jpb~h"kdw
    let fieldname = "_" . @k
    let preSet = "private " . type . " " . fieldname . ";\npublic " . type . " " . name . "\n{\nget\n{\nreturn " . fieldname  . ";\n}\nset\n{\n"
    let postSet = "\n}\n}"
    if a:useSetProperty == 1
        let @h = preSet . "SetProperty(ref " . fieldname . ", value);" . postSet
    else
        let @h = preSet . fieldname . " = value;" . postSet
    endif

    normal! "hpkdd
    normal! v
    call setpos('.',[0,bottomLine,0])
    normal! =
    call setpos('.',[0,currLine,0])
    normal! v
    call setpos('.',[0,bottomLine,0])
    normal! :'<,'>s/_MyVal/_myVal/g
    call setpos('.',[0,bottomLine,0])
    normal! j
endfunction

function CreateBackingFieldProperty()
    call CreateNonAutoProperty(0)
endfunction

function CreateViewModelFieldProperty()
    call CreateNonAutoProperty(1)
endfunction

nnoremap <Leader>pp <Esc>:call CreateProperty()<CR>
nnoremap <Leader>pb <Esc>:call CreateBackingFieldProperty()<CR>
nnoremap <Leader>pv <Esc>:call CreateViewModelFieldProperty()<CR>

