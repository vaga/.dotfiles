"
" .vimrc
"

" General
set encoding=utf-8                  " encoding used inside vim
" set mouse=a                       " enable using the mouse
set hidden                          " buffer becomes hidden when it is abandoned
set autoread                        " automatically reload files changed outside of Vim
set backspace=indent,eol,start      " allow backspacing over everything in insert mode

" Spaces and Tabs
set tabstop=4                       " number of visual spaces per <Tab>
set shiftwidth=4                    " number of spaces to use for each step of (auto)indent
set softtabstop=4                   " number of spaces in tab when editing
set expandtab                       " tabs are spaces
set autoindent                      " always set autoindenting on
set list                            " display unprintable characters
set listchars=tab:»\ ,trail:·       " customize the unprintable characters

" Interface and Colors
syntax enable                       " enable syntax processing
colorscheme hybrid                  " load color scheme
set termguicolors                   " enable true colors support
set background=dark                 " adjust the color groups
set title                           " show the filename in window titlebar
set number                          " show line numbers
set showcmd                         " show command in bottom bar
set wildmenu                        " improve command-line completion
set ruler                           " show the current cursor position
set nowrap                          " don't wrap lines
set scrolloff=2                     " minimal number of screen lines to above and below the cursor

" Search
set ignorecase                      " ignore case when searching
set smartcase                       " override the 'ignorecase' option if the search pattern contains upper case characters
set hlsearch                        " highlight search results
set incsearch                       " makes search act like search in modern browsers

" Backup
set nobackup                        " no backup before overwriting file
set nowritebackup                   " no backup before overwriting file
set noswapfile                      " don't use a swapfile

" Filetype
filetype indent on                  " enable loading indent files for specific file types
filetype plugin on                  " enable loading plugin files for specific file types
