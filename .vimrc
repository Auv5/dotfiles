set nocompatible
set number
set autoindent

set expandtab
set shiftwidth=4
set softtabstop=4

filetype indent on

syntax on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'jnurmine/Zenburn'

color zenburn

let mapleader  = ","

map <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
map <leader>n :bnext!<CR>
map <leader>p :bprev!<CR>
map <leader>d :bdelete<CR>
map ! :!

autocmd BufWritePost ~/.vimrc source ~/.vimrc
autocmd FileType make setl noexpandtab
