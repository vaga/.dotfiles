return {
  'nvim-treesitter/nvim-treesitter',

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
    })
  end,
}
