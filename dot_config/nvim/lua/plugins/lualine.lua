return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
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
    })
  end,
}
