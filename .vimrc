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

" Directory style listing
Plugin 'scrooloose/nerdtree'

" Sublime style multi cursor
Plugin 'terryma/vim-multiple-cursors'

" Auto close quotes, etc.
Plugin 'Raimondi/delimitMate'

" Add emmet
Plugin 'mattn/emmet-vim'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" add repeat support for plugins
Plugin 'tpope/vim-repeat'

" add support for comments
Plugin 'tpope/vim-commentary'

" auto completions
Plugin 'Valloric/YouCompleteMe'

" better JS syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" better indentation 
Plugin 'pangloss/vim-javascript'

" ternjs
Plugin 'ternjs/tern_for_vim'

" Coffescript support
Plugin 'kchmck/vim-coffee-script'

" React native support
Plugin 'mxw/vim-jsx'

" Install ag support
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Put your non-Plugin stuff after this line

syntax on       " syntax highlighting on by default

" indentation settings
set ts=2        " set tab width
set sw=2        " set shift width
set et          " expand tabs to spaces
filetype indent on
set ai
set si          " smart indent

" line numbers
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

" colorscheme in gui mode
if has('gui_running')
  colorscheme solarized
  set bg=dark
else
  let g:solarized_termcolors = 256
  colorscheme solarized
  set bg=dark
endif

" navigate panes with one keystroke
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural split behaviour
set splitbelow
set splitright

" auto add space when hitting enter in brackets
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" enable handlebars abbr
let g:mustache_abbreviations = 1

" ignore dirs
set wildignore+=*/node_modules/*

" ag for ctrlp
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set backspace=indent,eol,start

" leave some space when scrolling to top and bottom
set scrolloff=5

" allow react native support in all js files
let g:jsx_ext_required = 0

" disable vim file backups
set noswapfile

