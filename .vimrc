" General
scriptencoding utf-8
set fileencoding=utf-8
set nocompatible
set number
set showcmd
syntax on
" set mouse=a

" Style
set t_Co=256
colorscheme xoria256
set cursorline

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set list
set listchars=tab:>\ 

" Search
set hlsearch

" Folding
set foldmethod=marker

" Highlight +80 columns and whitespaces at the end of line
highlight OverLength ctermbg=52 ctermfg=white guibg=#592929
match OverLength /\s\+$/

" Filetype
filetype plugin on

" Mapping
map <F3> <esc>ggvG=
inoremap ''; '';<esc>hi
inoremap '' ''<esc>i
inoremap ""; "";<esc>hi
inoremap "" ""<esc>i
inoremap (( ()<esc>i
inoremap ((; ();<esc>hi
inoremap [[ []<esc>i
inoremap [[; [];<esc>hi
inoremap {{ {<cr><cr>}<esc>ki

" Vim custom
if filereadable("./.vim.custom")
    so ./.vim.custom
endif
