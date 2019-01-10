set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Write numbers in the ascending order inside a visual block
Plugin 'triglac/vim-visual-increment'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Write numbers in the ascending order inside a visual block
Plugin 'triglav/vim-visual-increment'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Set pastemode
set pastetoggle=<F2>

"Enableble folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

"Auto Indentation
filetype indent on
set wrap linebreak nolist
set fo+=l
au BufRead,BufNewFile *.tex setlocal textwidth=80
set wrapmargin=0
set fileformat=unix
set shiftwidth=4
set expandtab
set softtabstop=4
set tabstop=4
Plugin 'vim-scripts/indentpython.vim'

"UTF8 Support
set encoding=utf-8

"Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }


"Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

"File Browsing
Plugin 'scrooloose/nerdtree'
"Using tabs
Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup = 0
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

"Line Numbering
set nu

"Airline
Plugin 'vim-airline/vim-airline'

"Whitespace
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:·
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
    let &fillchars = "vert:\u254e,fold:\u00b7"
endif
set list

"System Clipboard
set clipboard=unnamedplus,autoselect

" show the matching part of the pair for [] {} and ()
set showmatch

"Bracekt Auto completion
"inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap        (  ()<Left>
"inoremap        [  []<Left>
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
"inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"nnoremap j jzz
"nnoremap k kzz
nnoremap G Gzz
command W w
command Q q
command Wq wq
command WQ wq
