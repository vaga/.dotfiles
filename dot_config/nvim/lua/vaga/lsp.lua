vim.diagnostic.config({
  virtual_text = { prefix = '●', spacing = 4 },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinitions')
    map('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementions')
    map('n', 'gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})

vim.lsp.enable({
  'gopls',
  'intelephense',
  'lua_ls',
  'ts_ls',
  'vue_ls',
})
