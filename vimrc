"
" .vimrc
"

" General {{{
set encoding=utf-8                  " encoding used inside vim
set hidden                          " buffer becomes hidden when it is abandoned
set autoread                        " automatically reload files changed outside of vim
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set updatetime=1000                 " time in millisecond that is waited to fire CursorHold autocommand event
set timeout                         " time out on mappings and key codes
set timeoutlen=1000                 " time in millisecond that is waited for a mapped key sequence to complete
set ttimeoutlen=100                 " time in millisecond that is waited for a key code to complete
set lazyredraw                      " don't update the display when executing macros
let mapleader="\\"                  " define leader key for custom mappings
" }}}

" Spaces and tabs {{{
set tabstop=4                       " number of visual spaces per <Tab>
set shiftwidth=4                    " number of spaces to use for each step of (auto)indent
set shiftround                      " round indent to multiple of 'shiftwidth'
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
set signcolumn=yes                  " always draw the sign column
set cursorline                      " highlight the screen line of the cursor
set virtualedit=block               " allow virtual editing in visual mode
set scrolloff=5                     " minimal number of screen lines to above and below the cursor
set sidescrolloff=5                 " minimal number of screen columns to keep to the left and to the right of the cursor
set textwidth=120                   " maximum width of text that is being inserted
set colorcolumn=+1                  " highlight the screen column of the 'textwidth' value
set nowrap                          " don't wrap lines
" }}}

" Status and command line {{{
set laststatus=2                    " always show the status line
set ruler                           " show the current cursor position
set showcmd                         " show command in bottom bar
set wildmenu                        " improve command-line completion
set wildignore+=.DS_Store,*.tmp
set wildignore+=*.jpg,*.png,*.gif
" }}}

" Search {{{
set ignorecase                      " ignore case when searching
set smartcase                       " override the 'ignorecase' option if the search pattern contains upper case characters
set hlsearch                        " highlight search results
set incsearch                       " makes search act like search in modern browsers
" }}}

" Autocomplete {{{
set completeopt=menuone             " show popup menu to show possible completions even if only one match
set infercase                       " case of the match is adjusted depending on the typed text
" }}}

" Backup {{{
set nobackup                        " no backup before overwriting file
set nowritebackup                   " no backup before overwriting file
set noswapfile                      " don't use a swapfile
" }}}

" Netrw {{{
let g:netrw_banner=0                " suppress the banner
let g:netrw_altv=1                  " change from left splitting to right splitting
" }}}

" Filetype {{{
filetype plugin on                  " enable loading plugin files for specific file types
filetype indent on                  " enable loading indent files for specific file types
" }}}

" General mapping {{{
"   Quickfix mapping {{{
nnoremap [q :exe (v:count ? v:count : "")"cprevious"<CR>zv
nnoremap ]q :exe (v:count ? v:count : "")"cnext"<CR>zv
nnoremap [Q :exe (v:count ? v:count : "")"cfirst"<CR>zv
nnoremap ]Q :exe (v:count ? v:count : "")"clast"<CR>zv
"   }}}

"   Location mapping {{{
nnoremap [l :exe (v:count ? v:count : "")"lprevious"<CR>zv
nnoremap ]l :exe (v:count ? v:count : "")"lnext"<CR>zv
nnoremap [L :exe (v:count ? v:count : "")"lfirst"<CR>zv
nnoremap ]L :exe (v:count ? v:count : "")"llast"<CR>zv
"   }}}

"   Buffer mapping {{{
nnoremap [b :exe (v:count ? v:count : "")"bprevious"<CR>
nnoremap ]b :exe (v:count ? v:count : "")"bnext"<CR>
nnoremap [B :exe (v:count ? v:count : "")"bfirst"<CR>
nnoremap ]B :exe (v:count ? v:count : "")"blast"<CR>
"   }}}
" }}}

" Autocmd {{{
augroup templates
    autocmd!
    autocmd BufNewFile *.php silent! 0r $HOME/.vim/templates/php.tpl
    autocmd BufNewFile *.vue silent! 0r $HOME/.vim/templates/vue.tpl
augroup END

augroup toggle_relativenumber
    autocmd!
    " show relative numbers in a buffer that has focus and is in normal mode
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | :set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &number | :set norelativenumber | endif
augroup END
" }}}
