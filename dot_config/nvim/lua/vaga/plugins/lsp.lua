local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local null_ls = require('null-ls')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
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
lspconfig.lua_ls.setup {
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

-- Prettier & co
null_ls.setup({
  on_attach = function(_, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { 'javascript', 'typescript', 'vue', 'css', 'scss', 'json', 'html', 'markdown' },
    }),
  },
})
