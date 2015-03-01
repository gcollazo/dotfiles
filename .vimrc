execute pathogen#infect()

let mapleader=","
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

syntax on
set number
set numberwidth=5
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
set nobackup
set noswapfile
set ruler
set autowrite
set backspace=2
set ruler

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Color
set background=dark
colorscheme solarized

" 80 char ruler
set textwidth=80
set colorcolumn=+1

" Remove trailing whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

" NERDTree
cd ~/Code
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.pyc$']

" syntastic
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_check_on_open=1

"ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|tmp\|dist\|bower_components'

" GUI Settings
if has("gui")
  " Font
  set guifont=Inconsolata\ for\ Powerline:h19

  " Color
  set background=dark
  colorscheme base16-paraiso

  " vim-airline
  set laststatus=2
  let g:airline_powerline_fonts = 1
  let g:airline_theme='powerlineish'
  let g:airline#extensions#branch#enabled=1
  let g:airline#extensions#syntastic#enabled=1
endif
