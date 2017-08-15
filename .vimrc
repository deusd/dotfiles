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

" ternjs
Plugin 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx']  }

" better indentation
Plugin 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx']  }
Plugin 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']  }

" React native support
Plugin 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx']  }

" Install cool status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ftl support
Plugin 'andreshazard/vim-freemarker'

Plugin 'stephenway/postcss.vim'

" Add easy motion for fast movement around files
Plugin 'easymotion/vim-easymotion'

" Tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" syntastic
Plugin 'vim-syntastic/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" faster file search
Plugin 'mileszs/ack.vim'

"

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Put your non-Plugin stuff after this line

syntax on       " syntax highlighting on by default

" indentation settings
set ts=2        " set tab width
set sw=2        " set shift width
set et          " expand tabs to spaces
filetype indent on
set ai          " auto indent"
" set si          " smart indent

" line numbers
set number      " numbers on

" map leader to ,
let mapleader = ","

" auto update vimrc on save
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" better searching
set incsearch
set ignorecase
set smartcase

" indent file
nnoremap <c-i> mmggVG='m

" colorscheme in gui mode
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

if has('gui_running')
  colorscheme solarized
  set bg=light
else
  set background=dark
  let g:solarized_termtrans = 1
  colorscheme solarized
endif

" airline setup
let g:airline_powerline_fonts = 1
set laststatus=2

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

" Ignore some folders and files for CtrlP indexing
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif

if exists("g:ctrlp_custom_ignore")
  unlet g:ctrlp_custom_ignore
endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }


" force syntax
au BufRead,BufNewFile *.tern-project set filetype=json
au BufRead,BufNewFile *.bashrc set filetype=json
au BufRead,BufNewFile *.ftl set filetype=freemarker
" au BufRead,BufNewFile *.js set filetype=javascript.jsx

set backspace=indent,eol,start

" leave some space when scrolling to top and bottom
set scrolloff=5

" allow react native support in all js files
let g:jsx_ext_required = 0

" disable vim file backups
set noswapfile

" autoclose scratch / preview window
autocmd CompleteDone * pclose

" show possible completions in tabs
set wildmenu

" wrap
" set nowrap

" line number bg color same as bg
highlight clear LineNr

" let g:airline_theme='solarized'

" don't skip over wrapped lines
nmap j gj
nmap k gk

" NERDTree settings
" map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
map <leader>n :NERDTreeToggle<CR>

""close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

let g:syntastic_javascript_checkers=['eslint']

" autofix with eslint
set autoread
" let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_javascript_eslint_args = ['--fix']
function! SyntasticCheckHook(errors)
  checktime
endfunction

" ag for ctrlp
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

