" vim-plug configuration
call plug#begin()
"CtrlP
Plug 'ctrlpvim/ctrlp.vim'
"Dash integration plugin
Plug 'rizzatti/dash.vim'
"NERD Tree
Plug 'scrooloose/nerdtree'
"Clojure
Plug 'tpope/vim-fireplace'
"Paredit
Plug 'kovisoft/paredit'
"Tender theme
Plug 'jacoborus/tender.vim'
"Vim Airline
Plug 'vim-airline/vim-airline'
"Vim airline themes
Plug 'vim-airline/vim-airline-themes'
"Vim Bundler
Plug 'tpope/vim-bundler'
"Vim CLojure Static
Plug 'guns/vim-clojure-static'
"Vim Projectionist
Plug 'tpope/vim-projectionist'
"Vim Rails
Plug 'tpope/vim-rails'
"Vim rake
Plug 'tpope/vim-rake'
"Vim endwise
Plug 'tpope/vim-endwise'
"Vim Rspec
Plug 'thoughtbot/vim-rspec'
"Vim TS
Plug 'leafgarland/typescript-vim'
"Vim Angular CLI
Plug 'bdauria/angular-cli.vim'
"Emmet Vim
Plug 'mattn/emmet-vim'
call plug#end()

syntax on
filetype plugin indent on

"Angular CLI load by indicator file
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

"Emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-i>'

" Paredit
let g:paredit_mode = 1
"Leader key
let mapleader = ','
" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "left"

"CtrlP
set runtimepath^=~/.vim/plugged/ctrlp.vim
let g:ctrlp_user_command = 'find %s -type f'

" Color Scheme
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme tender

" Vim Airline
set laststatus=2
set t_Co=256
set encoding=utf-8
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1

"Other Configurations
set backspace=indent,eol,start
set guifont=Source\ Code\ Pro\ for\ Powerline
set nu!

"Ruby
:map <leader>r :!ruby %<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"Tabs configuration
set smarttab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
nnoremap <C-l> :bnext<CR>
nnoremap <C-k> :bprev<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
