return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  opts = {
    ensure_installed = {
      'c',
      'cpp',
      'css',
      'dockerfile',
      'gdscript',
      'go',
      'html',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'markdown',
      'php',
      'rust',
      'scss',
      'sql',
      'typescript',
      'vimdoc',
      'vue',
    },
    highlight = { enable = true },
    indent = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
        },
      },
    },
  },

  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
