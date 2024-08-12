return {
  'nvim-treesitter/nvim-treesitter',

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'markdown',
        'c',
        'cpp',
        'css',
        'go',
        'javascript',
        'lua',
        'php',
        'rust',
        'scss',
        'typescript',
        'vue',
        'gdscript',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.inner',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.inner',
          },
        },
      },
    })
  end,
}
