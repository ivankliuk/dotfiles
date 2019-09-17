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
set clipboard=unnamed                  " Use single clipboard for MacOS X

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
"                                File browsing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner=0                 " Remove useless banner
let g:netrw_liststyle=3              " Enable tree view

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

nmap <silent> <F5> :set spell!<CR>     " Toggle spell checking
" <F7> calls PyFlake8
map <F10> :q<CR>

" Comma is followed by a space most of the time
inoremap , ,<SPACE>

" / cleans previous search
nnoremap / :nohl<CR>/

let mapleader=","                      " Remap leader key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically removing all trailing whitespace
autocmd BufWritePre * call StripWhitespace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug needs to be installed firstly:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vmchale/dhall-vim'             " Syntax highlighting for Dhall

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! StripWhitespace()
    :%s/\s\+$//e
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
