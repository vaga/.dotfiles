require('vaga.options')
require('vaga.lsp')

require('lazy').setup({
  ui = { border = 'single' },
  spec = {
    { import = 'vaga.plugins' },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
