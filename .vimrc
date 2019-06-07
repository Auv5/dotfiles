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

" Initialize plugin system
call plug#end()

let mapleader  = ","

map <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
map <leader>n :bnext!<CR>
map <leader>p :bprev!<CR>
map <leader>d :bdelete<CR>
map ! :!

autocmd BufWritePost ~/.vimrc source ~/.vimrc
autocmd FileType make setl noexpandtab
