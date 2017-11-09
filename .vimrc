set nocompatible
set number
set autoindent

set expandtab
set shiftwidth=2
set softtabstop=2

filetype indent on

syntax on
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'
Bundle 'jnurmine/Zenburn'
" Adds commands to Vim to surround things (i.e. (), "")
Bundle 'tpope/vim-surround'

color zenburn

let mapleader  = ","

map <leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
map <leader>n :bnext!<CR>
map <leader>p :bprev!<CR>
map <leader>d :bdelete<CR>
map ! :!

autocmd BufWritePost ~/.vimrc source ~/.vimrc
autocmd FileType make setl noexpandtab
