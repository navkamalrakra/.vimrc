autocmd vimenter * ++nested colorscheme gruvbox

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'townk/vim-autoclose'

call plug#end()

" NerdTree
let NERDTreeShowHidden=1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Autoclose
inoremap {<CR> {<CR>}<C-o>O

" Show Line numbers
set number

" Highlight Current Line
set cursorline

" load filetype-specific indent files
filetype indent on 

" visual autocomplete for command menu
set wildmenu

" highlight matching [{()}]
set showmatch

" search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" fold based on indent level
set foldmethod=indent

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
