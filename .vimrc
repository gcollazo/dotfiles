" Pathogen
call pathogen#infect()
call pathogen#helptags()

let mapleader=","
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

syntax on
set number
set hlsearch
set showmatch
set incsearch
set ignorecase
set nowrap
set autoindent
set history=1000
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Nerdtree
autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
:nmap <leader>n :NERDTreeToggle<CR>

" Color
set background=dark
colorscheme solarized
