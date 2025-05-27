return {
  'nvim-telescope/telescope.nvim',
  enabled = true,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },

  opts = {
    defaults = {
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    extensions = {
      file_browser = {
        dir_icon = ' ',
        hijack_netrw = true,
      },
    },
  },

  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
    telescope.load_extension('file_browser')

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
    vim.keymap.set('n', '<Leader>fs', function()
      require('telescope.builtin').lsp_document_symbols()
    end, options)
    vim.keymap.set('n', '<Leader>fS', function()
      require('telescope.builtin').lsp_dynamic_workspace_symbols()
    end, options)

    -- TODO: remove when telescope uses winborder option
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TelescopeFindPre',
      callback = function()
        vim.opt_local.winborder = 'none'
        vim.api.nvim_create_autocmd('WinLeave', {
          once = true,
          callback = function()
            vim.opt_local.winborder = 'single'
          end,
        })
      end,
    })
  end,
}
