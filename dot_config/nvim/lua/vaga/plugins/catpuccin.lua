require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  custom_highlights = function(colors)
    return {
      NormalFloat = { fg = colors.text, bg = colors.base },
      CursorLine = { bg = colors.mantle },
    }
  end,
}

vim.cmd [[ colorscheme catppuccin ]]
