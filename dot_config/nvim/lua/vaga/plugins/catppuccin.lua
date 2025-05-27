return {
  'catppuccin/nvim',
  enabled = true,

  name = 'catppuccin',
  priority = 1000,
  lazy = false,

  opts = {
    flavour = 'mocha',
    transparent_background = true,
    integrations = {
      blink_cmp = true,
    },
  },

  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme('catppuccin')
  end,
}
