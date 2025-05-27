vim.g.mapleader = ' ' -- define <Leader> key
vim.g.maplocalleader = '\\' -- define <LocalLeader> key

-- General {{{1
vim.opt.updatetime = 50 -- time in millisecond that is waited to fire CursorHold autocommand event
vim.opt.timeoutlen = 500 -- time in millisecond to wait for a mapped sequence to complete
vim.opt.clipboard = 'unnamedplus' -- use clipboard register '+' for all yank, delete, change and put operation
vim.opt.mouse = '' -- disable mouse

-- Spaces and tabs {{{1
vim.opt.tabstop = 4 -- number of visual spaces per <Tab>
vim.opt.shiftwidth = 4 -- number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- tabs are spaces
vim.opt.list = true -- display unprintable characters
vim.opt.listchars = { -- customize the unprintable characters
  trail = '·',
  tab = '» ',
  eol = '↵',
}

-- User interface {{{1
vim.opt.cursorline = true -- highlight the screen line of the cursor
vim.opt.wrap = false -- don't wrap lines
vim.opt.number = true -- show the line number
vim.opt.relativenumber = true -- show the line number relative to the line with the cursor in front of each line
vim.opt.scrolloff = 5 -- minimal number of screen lines to above and below the cursor
vim.opt.sidescrolloff = 5 -- minimal number of screen columns to the left and to the right of the cursor
vim.opt.virtualedit = 'block' -- allow virtual editing in visual mode
vim.opt.signcolumn = 'yes' -- always draw the sign column
vim.opt.showmode = false -- don't put mode on the last line
vim.opt.splitright = true -- put the new window right of the current one
vim.opt.splitbelow = true -- put the new window below of the current one
vim.opt.pumheight = 20 -- maximum number of items to show in the popup menu
vim.opt.formatoptions = 'jcroqlnt' -- automatic formatting for comments and text
vim.opt.winborder = 'single'

-- Command line {{{1
vim.opt.wildmode = 'longest:full,full' -- first complete longest common part, then full match on repeated tab presses
vim.opt.wildignorecase = true -- ignore case for file completion
vim.opt.wildignore = { -- ignore some patterns for file completion
  '.DS_Store',
}

-- Search {{{1
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- override the 'ignorecase' option if the search pattern contains upper case characters.

-- Autocomplete {{{1
vim.opt.completeopt = {
  'menu',
  'menuone', -- use the popup menu also when there is only one match
  'noinsert', -- do not insert a match until the user selects a match from menu
}

-- Data recovery {{{1
vim.opt.swapfile = false -- disable creation of swap files
vim.opt.undofile = true -- enable persistent undo history across sessions
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo' -- directory to store undo history files
