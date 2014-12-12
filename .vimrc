execute pathogen#infect()

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
set shiftwidth=2
set tabstop=2
set softtabstop=2

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Font
set guifont=Inconsolata:h18

" Color
set background=dark
colorscheme base16-paraiso
