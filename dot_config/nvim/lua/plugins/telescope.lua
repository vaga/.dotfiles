return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },

  config = function()
    require('telescope').setup({
      extensions = {
        file_browser = {
          dir_icon = ' ',
          hijack_netrw = true,
        },
      },
    })

    require('telescope').load_extension('file_browser')

    local options = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>ft', function()
      require('telescope').extensions.file_browser.file_browser({ path = '%:p:h' })
    end, options)
    vim.keymap.set('n', '<Leader>ff', function()
      require('telescope.builtin').find_files()
    end, options)
    vim.keymap.set('n', '<Leader>fg', function()
      require('telescope.builtin').live_grep()
    end, options)
    vim.keymap.set('n', '<Leader>fc', function()
      require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })
    end, options)
    vim.keymap.set('n', '<Leader>fb', function()
      require('telescope.builtin').buffers()
    end, options)
    vim.keymap.set('n', '<Leader>fd', function()
      require('telescope.builtin').diagnostics()
    end, options)
  end,
}
