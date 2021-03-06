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
"Themes
Plug 'jacoborus/tender.vim'
Plug 'crusoexia/vim-monokai'
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
"NeoFormat
Plug 'sbdchd/neoformat'
"Vim js
Plug 'pangloss/vim-javascript'
"Vim JSX
Plug 'mxw/vim-jsx'
"Vim Elixir
Plug 'elixir-editors/vim-elixir'
"Vim easygit
Plug 'neoclide/vim-easygit'
"Vim idris
Plug 'idris-hackers/idris-vim'
call plug#end()

syntax on
filetype plugin indent on

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

"EasyGit Activation
let g:easygit_enable_command = 1

"Angular CLI load by indicator file
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

"Emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css,erb EmmetInstall
let g:user_emmet_leader_key='<C-i>'

" Auto-format on save
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.jsx Neoformat prettier
augroup END

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
colorscheme monokai

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
nnoremap <C-l> :bnext<CR>
nnoremap <C-k> :bprev<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
