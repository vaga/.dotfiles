local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local options = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Golang {{{1
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- PHP {{{1
lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- LUA {{{1
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Typescript/Javascript/Vue
local function on_new_config(config, root_dir)
  config.init_options.typescript.tsdk = os.getenv("HOME") .. '/.config/yarn/global/node_modules/typescript/lib'

  local global_path = util.path.join(root_dir, 'node_modules', 'typescript', 'lib')
  if util.path.exists(global_path) then
    config.init_options.typescript.tsdk = global_path
  end
end

lspconfig.volar.setup {
  filetypes = { 'javascript', 'typescript', 'vue' },
  root_dir = util.root_pattern('package.json', '.git/'),
  on_new_config = on_new_config,
  on_attach = on_attach,
  capabilities = capabilities,
}
