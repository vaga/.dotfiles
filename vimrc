"
" .vimrc
"

" General {{{
set encoding=utf-8                  " encoding used inside vim
set hidden                          " buffer becomes hidden when it is abandoned
set autoread                        " automatically reload files changed outside of Vim
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set updatetime=1000                 " time in millisecond that is waited to fire CursorHold autocommand event
set timeout                         " time out on mappings and key codes
set timeoutlen=1000                 " time in millisecond that is waited for a mapped key sequence to complete
set ttimeoutlen=100                 " time in millisecond that is waited for a key code to complete
set lazyredraw                      " don't update the display when executing macros
" }}}

" Spaces and tabs
set tabstop=4                       " number of visual spaces per <Tab>
set shiftwidth=4                    " number of spaces to use for each step of (auto)indent
set softtabstop=4                   " number of spaces in tab when editing
set expandtab                       " tabs are spaces
set autoindent                      " always set autoindenting on
set list                            " display unprintable characters
set listchars=tab:»\ ,trail:·       " customize the unprintable characters
" }}}

" Colors {{{
syntax enable                       " enable syntax processing
set termguicolors                   " enable true colors support
set background=dark                 " adjust the color groups
colorscheme hybrid                  " load color scheme
" }}}

" User Interface {{{
set title                           " show the filename in window titlebar
set number                          " show line numbers
set numberwidth=4                   " minimal number of columns to use for the line number
set showcmd                         " show command in bottom bar
set wildmenu                        " improve command-line completion
set nowrap                          " don't wrap lines
set textwidth=120                   " maximum width of text that is being inserted
set colorcolumn=+1                  " highlight the screen column of the 'textwidth' value
set scrolloff=3                     " minimal number of screen lines to above and below the cursor
set sidescrolloff=5                 " minimal number of screen columns to keep to the left and to the righ of the cursor
set cursorline                      " highlight the screen line of the cursor
set signcolumn=yes                  " always draw the sign column
" }}}

" Status line {{{
set laststatus=2                    " always show the status line
set ruler                           " show the current cursor position
" }}}

" Search {{{
set ignorecase                      " ignore case when searching
set smartcase                       " override the 'ignorecase' option if the search pattern contains upper case characters
set hlsearch                        " highlight search results
set incsearch                       " makes search act like search in modern browsers
" }}}

" Backup {{{
set nobackup                        " no backup before overwriting file
set nowritebackup                   " no backup before overwriting file
set noswapfile                      " don't use a swapfile
" }}}

" Filetype {{{
filetype indent on                  " enable loading indent files for specific file types
filetype plugin on                  " enable loading plugin files for specific file types
" }}}
