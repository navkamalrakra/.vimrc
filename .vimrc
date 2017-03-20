" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes


Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'yggdroot/indentline'
Plug 'townk/vim-autoclose'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

function! BuildYCM(info)
   if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --system-libclang
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

" NerdTree
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree

" Solarized Scheme
syntax enable
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

" YouCompleteMe
let g:ycm_key_invoke_completion = '<C-b>'

"IndentLine
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239

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

" YCM
" let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
