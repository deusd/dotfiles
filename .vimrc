if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" ------ Plugins below here ------ "
" js jsx syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" intellisense
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" awesome tpope plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" file system stuff
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" faster searching
Plug 'mileszs/ack.vim'

" close pairs
Plug 'jiangmiao/auto-pairs'

" close tags
Plug 'alvan/vim-closetag'

" linting
Plug 'w0rp/ale'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color scheme
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
Plug 'ajmwagar/vim-deus'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

" css
" Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/Colorizer'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components'
Plug 'Quramy/vim-js-pretty-template'
"
" keep padding with no number
Plug 'haya14busa/vim-keeppad'

" Initialize plugin system
call plug#end()

" basic settings
set number
syntax on
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent
set expandtab

" reload on save
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" jsx in js
let g:jsx_ext_required = 0

" linting
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" faster searching
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" navigate panes with one keystroke
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easy copy
vnoremap <C-C> "+y"

" open new tab
nnoremap <C-t> :tabnew<Return>
inoremap <C-t> <Esc>:tabnew<Return>

" more natural split behaviour
set splitbelow
set splitright

" backspace deletes indents
set backspace=indent,eol,start

" disable vim file backups
set noswapfile

" show possible completions in tabs
set wildmenu

" leave some space when scrolling to top and bottom
set scrolloff=5

" line number bg color same as bg
" highlight clear LineNr

" incremental search
set ignorecase
set incsearch

" don't skip over wrapped lines
nmap j gj
nmap k gk

" remap leader
let mapleader=","

" map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
" let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1
" let g:nerdtree_tabs_open_on_gui_startup=1
" let g:nerdtree_tabs_open_on_console_startup=1
nmap <leader>n :NERDTreeToggle<CR>

""close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ag for ctrlp
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

""" Ale setup (linting)
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint']
\}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" TODO add keys for this
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_sign_error =   '⚠️ '
let g:ale_sign_warning = '❌'

" tern setup
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" highlight css in js
" call jspretmpl#register_tag('styled', 'scss')
" au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-
autocmd FileType javascript JsPreTmpl scss
autocmd FileType javascript.jsx JsPreTmpl scss

" set word wrap for markdown
au FileType markdown set wrap linebreak nolist

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

if $TERM_PROGRAM =~ "iTerm"
  " colorscheme setup
  set bg=dark
  colorscheme onedark
endif

" vim wrap at 72 lines
au FileType gitcommit set tw=72

" enable mouse mode by default
set mouse=a

" close tags settings
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


