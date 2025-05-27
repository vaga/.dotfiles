return {
  dir = '~/Projects/Vaga/bro.nvim',
  enabled = true,

  config = function()
    local bro = require('bro')
    bro.setup()
  end,
}
