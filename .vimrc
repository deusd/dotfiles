set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

filetype plugin indent on    " required

" Useful git features
Plugin 'tpope/vim-fugitive'

" Awesome rails commands
Plugin 'tpope/vim-rails'

" Tab completions
Plugin 'ervandew/supertab'

" Surrounds with chars
Plugin 'tpope/vim-surround'

" Ctrl-p sublime like file opening
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Put your non-Plugin stuff after this line

syntax on       " syntax highlighting on by default
set ts=2        " set tab width
set sw=2        " set shift width
set et          " expand tabs to spaces
set si          " smart indent
set number      " numbers on

" auto update vimrc on save
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" status line at bottom of window
set modeline
set statusline=%F%m%r%h%w\ [\%03.3b]\ [\%02.2B]\ [%04l,%04v][%p%%]\ [%L]

" better searching
set incsearch
set ignorecase
set smartcase

" indent file
nnoremap <c-i> mmggVG='m
