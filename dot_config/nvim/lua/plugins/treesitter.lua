return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'php', 'go', 'vue', 'typescript', 'javascript', 'lua', 'scss', 'css' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'php' },
      },
      indent = {
        enable = true,
        disable = { 'php' },
      },
    })
  end,
}
