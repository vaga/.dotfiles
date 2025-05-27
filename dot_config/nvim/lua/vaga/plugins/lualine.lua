return {
  'nvim-lualine/lualine.nvim',
  enabled = true,

  opts = {
    options = {
      theme = 'catppuccin',
      icons_enabled = false,
      component_separators = { left = '·', right = '·' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },

    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { { 'filename', path = 1 } },

      lualine_x = {},
      lualine_y = { 'filetype', 'fileformat', 'encoding' },
      lualine_z = { 'location' },
    },
  },
}
