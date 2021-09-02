" automated installation of junegunn/vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

set mouse=a

call plug#begin('~/.config/nvim/plugged')

" smooth scroll
Plug 'psliwka/vim-smoothie'

Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'vim-airline/vim-airline'

" Plug 'othree/html5.vim'

" Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}

" Distraction free mode. Toggle with :Goyo
Plug 'junegunn/goyo.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'majutsushi/tagbar'

call plug#end()

"
" General settings
"

" Highlight bad white spaces
autocmd BufEnter * highlight BadWhitespace ctermbg=red guibg=red
autocmd BufEnter * match BadWhitespace /^\t\+/
autocmd BufEnter * match BadWhitespace /\s\+$/

" Search settings
set hlsearch
set incsearch

set hidden

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

" display line numbers
set nu

" Removes trailing spaces.
"
" Invoke it with `:call TrimWhiteSpaces`
function TrimWhiteSpaces()
    %s/\s*$//
    ''
:endfunction


"
" Plugin setup
"


"
" Go setup
"
" let g:go_fmt_command = "goimports"

"
" nerdtree setup
"
let NERDTreeIgnore = ['\.pyc$']

"
" FZF setup
"

let mapleader = " "
nnoremap <silent> <Leader><Space> :Files<CR>
