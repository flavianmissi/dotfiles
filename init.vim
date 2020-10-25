set nocompatible
filetype off
"Set
let $VIMHOME = $HOME."/.vim"
set mouse=a

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'elzr/vim-json'
Plugin 'powerline/powerline'
Plugin 'plentiform/go-ide'

Plugin 'html5.vim'
Plugin 'vim-airline'

" Plugin 'vim-autoclose'
" Plugin 'vim-go'
Plugin 'fatih/vim-go'
Plugin 'ncm2/ncm2-go'
" Plugin 'vim-scala'


call vundle#end()            " required
filetype plugin indent on    " required

let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:go_fmt_command = "goimports"


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Setting PYTHONPATH
let $PYTHONPATH .= ":".$VIMHOME."/python"

"load bundle plugins
call pathogen#infect()

"Vundle

"add go vim plugins
set rtp+=$GOROOT/misc/vim

syntax on
"filetype on
filetype indent on
filetype plugin on

"Hidden mode
set hidden
set number

"Bad whitespaces
autocmd BufEnter * highlight BadWhitespace ctermbg=red guibg=red
autocmd BufEnter * match BadWhitespace /^\t\+/
autocmd BufEnter * match BadWhitespace /\s\+$/

"Search settings
set hlsearch
set incsearch

"Setting up tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set tabpagemax=20
set showtabline=4
set autoindent
set expandtab
set smartindent
set smarttab
set wildmenu
set wildmode=list:longest
set cursorline

"autocmd FileType * set noexpandtab
"autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4|set smartindent|set smarttab

" read open files again when changed outside Vim
set autoread

" which directory to use for the file browser
set browsedir=current

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" configure persitent undo
set undodir=/var/vim_undo

" folding
set foldmethod=indent

"Start mappings
"==============
"NERDTree
nmap <silent> <c-p> :NERDTreeToggle<CR>

" Removes trailing spaces
function TrimWhiteSpaces()
    %s/\s*$//
    ''
:endfunction

"Colorscheme
set background=dark

if has("gui_running")

    colorscheme macvim
    "guifont
    set guifont=Monaco:h12

    set guioptions=egmt
    "set fuoptions=maxvert,maxhorz
endif
