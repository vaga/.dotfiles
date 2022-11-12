local cp = require('catppuccin.palettes').get_palette()
local theme = require('lualine.themes.catppuccin')

theme.normal.c.fg = cp.subtext0

require('lualine').setup {
  options = {
    theme = theme,
    icons_enabled = false,
    component_separators = { left = '/', right = '/' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
    always_divide_middle = true,
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },

    lualine_x = {},
    lualine_y = { 'filetype', 'fileformat', 'encoding' },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },

    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
}
