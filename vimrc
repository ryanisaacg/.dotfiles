"Basic Vim Behavior
set backspace=2 "Make backspaces do what they do for any other editor
let mapleader=","

"Necessary flair
set bg=dark
set number "Line numbers
syntax on "Syntax highlighting

"Tabs 
"Each indent should be 4 space characters
set tabstop=4 "Make each tab 4 spaces
set shiftwidth=4 "Make sure auto-tabbing only indents 4 spaces
set autoindent
set expandtab
set smarttab
filetype plugin indent on

"Useful flair
set showmatch "Show matching parens and brackets
set hlsearch

"Text wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
noremap  <buffer> <silent> <Up> gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g0
noremap  <buffer> <silent> <End> g$

"Mouse
set mouse=a

"Disable backups completely
set nobackup
set nowritebackup
set noswapfile

"Allow each project to set its own vimrc
set exrc

"Plugins
"Install the plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"Install the plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-rsi'
Plug 'cohama/lexima.vim'
call plug#end()

"Set up the colorscheme
let g:onedark_termcolors=16

set hidden


" Configure the buftabline
let g:buftabline_numbers=1
let g:buftabline_separators=1
let g:buftabline_indicators=1

" Keybinds
" Fuzzy finder
nmap <silent> <ESC>t :FZF<CR>
" Add keybinds to jump to errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Clear highlighting
nmap <silent> <ESC>c :nohl<CR>
" Buffer-based tab switching
nmap <silent> gt :bn<CR>
nmap <silent> gT :bp<CR>

" Configure syntax highlighting
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight StatusLine ctermfg=white cterm=bold
highlight Comment ctermfg=LightGreen cterm=italic
highlight BufTabLineCurrent ctermbg=NONE ctermfg=white
highlight BufTabLineActive ctermbg=NONE ctermfg=blue
highlight BufTabLineHidden ctermbg=NONE ctermfg=magenta
highlight BufTabLineFill ctermbg=NONE

" Configure the statusline
set laststatus=2
set statusline=%#StatusLine#%f%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [line:\ %0l,\ column:\ %0v]\ [%p%%]

function! Src()
    so ~/.vimrc
endfunction
