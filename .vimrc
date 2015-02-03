"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden                             " Hides buffers instead of closing them
set nobackup                           " No backup files

" Write the buffer directly to the original file
set nowritebackup

set noswapfile                         " No swap files
" set backupdir=~/vim_backup           " Backup directory
set autoread                           " Watch for external file changes
set history=1000                       " Set history size

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lines longer than 79 columns will be broken
set textwidth=79

" Number of spaces to use for each step of (auto)indent
set shiftwidth=4

set tabstop=4                      " A hard TAB displays as 4 columns
set expandtab                      " Insert spaces when hitting TABs
set softtabstop=4                  " Insert/delete 4 spaces when hitting TAB/BS
set shiftround                     " Round indent to multiple of 'shiftwidth'

" Use shiftwidth instead of tabstop at start of the lines
set smarttab

" Align the new line indent with the previous line
set autoindent

" Allow backspacing over autoindent, line breaks (join lines),
" the start of insert
set backspace=indent,eol,start

" By default, disable autoindent when pasting text
set paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                              " Enable syntax
set nocompatible                       " Disable VI compatibility
set ttyfast                            " Enable fast terminal connection
set termencoding=utf-8                 " Terminal encoding
set encoding=utf-8                     " Default file encoding
set shortmess+=I                       " Don't show :intro
set number                             " Show line numbers
" set ruler                            " Show the cursor position all the time
set colorcolumn=80                     " Highlight 80 column
set cursorline                         " Highlight line where cursor is
set cursorcolumn                       " Highlight column where cursor is
set scrolloff=5                        " Keep at least 5 lines above/below cursor
set sidescrolloff=5                    " Keep at least 5 columns left/right of cursor
set nowrap                             " Don't wrap long lines
set splitbelow                         " Put the new window below the current one
set splitright                         " Put the new window right of the current one
set list                               " Show invisible characters
set listchars=tab:→→,trail:⋅,nbsp:␣,extends:❯,precedes:❮
set showcmd                            " Show (partial) command in the last line of the screen

if has('wildmenu')
  set wildmenu                         " Better VI command-line completion
  set wildmode=longest,list            " Complete to longest match and show hints as list
endif

if has('statusline')
 set laststatus=2

 " Broken down into easily includeable segments
 set statusline=                       " Reset statusline
 set statusline+=\[Buf#\ %n\]          " Buffer number
 set statusline+=%r                    " Read only flag [RO]
 set statusline+=%m                    " Modified flag [+]
 set statusline+=\ %.40F               " Filename with full path, max width=40
 set statusline+=\ %y                  " [filetype]

 set statusline+=%=                    " Right align
 set statusline+=\(%l\:%c\)            " (line:column)
 set statusline+=\ [%p%%\]             " [percent%]
endif

" To ignore this setting press and hold 'Shift' (or 'Alt/Option' in Mac OS X):
set mouse=a                            " Enable the use of the mouse in all modes
set ttymouse=xterm2                    " Make Vim splits resizable with mouse within tmux

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch                           " Highlight all search matches
set incsearch                          " Live search
set ignorecase                         " Ignore case in search patterns


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Colors and themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256                           " Set 256 terminal colors
colorscheme wombat256                  " Suitable color scheme

" Set highlighting color of ColorColumn to black
highlight ColorColumn ctermbg=0

" To use Solarized dark scheme:
" let g:solarized_termcolors=256
" syntax enable
" set background=dark
" colorscheme solarized

" Highlight columns from 80 to 999
let &colorcolumn=join(range(80,999),",")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unmap F1 key
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

nmap <silent> <F2> :NERDTreeToggle<CR> " Toggle NERDTree window
nmap <silent> <F3> :TagbarToggle<CR>   " Toggle TagBar window
" Toggles paste mode (for pasting from browser)
set pastetoggle=<F4>
nmap <silent> <F5> :set spell!<CR>     " Toggle spell checking
" <F7> calls PyFlake8
map <F10> :q<CR>

" Comma is followed by a space most of the time
inoremap , ,<SPACE>

" / cleans previous search
nnoremap / :nohl<CR>/

" Remap semicolon to colon in normal mode (no need in use Shift key)
nnoremap ; :

" Tabs and buffers navigation
map <silent><C-left> :tabprevious<CR>
map <silent><C-right> :tabnext<CR>
map <silent><C-up> :bprevious<CR>
map <silent><C-down> :bnext<CR>

let mapleader=","                      " Remap leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD Tree autorun
" autocmd vimenter * NERDTree

" Close vim if the only window left open is a NERDTree?
autocmd bufenter *
    \ if (winnr("$") == 1 &&
        \ exists("b:NERDTreeType") &&
        \ b:NERDTreeType == "primary") |
    \ q |
    \ endif

" Flake8 autocheck on buffer write
" autocmd BufWritePost *.py call Flake8()

" Automatically removing all trailing whitespace
autocmd BufWritePre * call StripWhitespace()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Development
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Look tags up in current directory instead of VIM working one
set tags=./tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle needs to be installed firstly:
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off                           " Disable file type detection

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'                 " Let Vundle manage Vundle
Plugin 'scrooloose/nerdtree'           " NERD Tree plugin
Plugin 'scrooloose/nerdcommenter'      " Commenting plugin
Plugin 'majutsushi/tagbar'             " Code navigation bar
Plugin 'nvie/vim-flake8'               " Flake8 check (needs flake8 package)
Plugin 'kien/ctrlp.vim'                " File finder
Plugin 'davidhalter/jedi-vim'          " Python autocompletion

call vundle#end()

" Loading the indent file for specific file types
filetype indent on
filetype plugin on                     " Filetype detection

" nerdtree config
let g:NERDTreeShowHidden=1             " Show hidden files
let NERDTreeIgnore=['\.pyc$']          " Don't show files with extentions

" tagbar config
let g:tagbar_hide_nonpublic = 1        " Shows private items

" vim-flake8 config
let g:flake8_show_in_gutter=1          " Show signs in the gutter

" CtrlP config
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! StripWhitespace()
    :%s/\s\+$//e
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
