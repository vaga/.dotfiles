-- General {{{1
vim.opt.hidden = true               -- buffer becomes hiddden when it is abandonned
vim.opt.updatetime = 250            -- time in millisecond that is waited to fire CursorHold autocommand event
vim.opt.lazyredraw = true           -- don't redraw the screen when executing macros
vim.opt.clipboard = 'unnamedplus'   -- use clipboard register '+' for all yank, delete, change and put operation
vim.opt.mouse = ''                  -- disable mouse
vim.g.mapleader = ' '               -- define <Leader> key

-- Spaces and tabs {{{1
vim.opt.tabstop = 4                 -- number of visual spaces per <Tab>
vim.opt.shiftwidth = 4              -- number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true            -- tabs are spaces
vim.opt.list = true                 -- display unprintable characters
vim.opt.listchars = {               -- customize the unprintable characters
  trail = '·';
  tab = '» ';
  eol = '↵';
}

-- User interface {{{1
vim.opt.termguicolors = true        -- enable true colors support
vim.opt.cursorline = true           -- highlight the screen line of the cursor
vim.opt.wrap = false                -- don't wrap lines
vim.opt.relativenumber = true       -- show the line number relative to the line with the cursor in front of each line
vim.opt.number = true               -- show the line number
vim.opt.numberwidth = 4             -- minimal number of columns to use for the line number
vim.opt.scrolloff = 5               -- minimal number of screen lines to above and below the cursor
vim.opt.sidescrolloff = 5           -- minimal number of screen columns to the left and to the right of the cursor
vim.opt.virtualedit = 'block'       -- allow virtual editing in visual mode
vim.opt.signcolumn = 'yes'          -- always draw the sign column
vim.opt.showmode = false            -- don't put mode on the last line

-- Command line {{{1
vim.opt.wildignorecase = true       -- ignore case for file completion
vim.opt.wildignore = {              -- ignore some patterns for file completion
  '.DS_Store',
  '*/node_modules/*',
  '*/vendor/*',
  '*/dist/*',
}

-- Search {{{1
vim.opt.ignorecase = true            -- ignore case in search patterns
vim.opt.smartcase = true             -- override the 'ignorecase' option if the search pattern contains upper case characters.

-- Autocomplete {{{1
vim.opt.completeopt = {
  'menu',
  'menuone',                         -- use the popup menu also when there is only one match
  'noinsert',                        -- do not insert a match until the user selects a match from menu
}

---- Status line {{{1
--vim.opt.statusline = ' %n |' ..     -- buffer number
--                     ' %f' ..       -- filename
--                     ' %m%r%w' ..   -- modified flag, readonly flag, preview flag
--                     '%=' ..        -- right align
--                     '%y' ..        -- filetype
--                     ' %3l:%-3c' .. -- line + column
--                     ' %3p%% '      -- percentage through file

-- Backup {{{1
vim.opt.swapfile = false             -- don't use a swapfile
