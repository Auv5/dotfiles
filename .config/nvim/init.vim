set nocompatible
set number
set autoindent

set expandtab
set shiftwidth=2
set softtabstop=2

filetype indent on

syntax on
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-scripts/Zenburn'
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'ruanyl/vim-gh-line'
Plug 'udalov/kotlin-vim'
Plug 'gabrielelana/vim-markdown'

" Initialize plugin system
call plug#end()

color zenburn

let mapleader  = ","

map <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
map <leader>n :bnext!<CR>
map <leader>d :bdelete<CR>
map <leader>p :bprev!<CR>
map <leader>c :only<CR>
map <leader>g :FZF<CR>
map <leader>! :e ~/.config/nvim/init.vim<CR>
map ! :term 

set mouse=a
set hidden
set clipboard=unnamed

autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd FileType make setl noexpandtab
