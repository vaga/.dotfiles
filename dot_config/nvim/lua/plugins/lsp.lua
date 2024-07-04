return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

    vim.diagnostic.config({
      float = { border = 'rounded' },
      virtual_text = {
        prefix = '●',
        spacing = 4,
      },
    })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local function on_attach(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

      vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    end

    -- Golang {{{1
    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- PHP {{{1
    lspconfig.intelephense.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Javascript, Typescript, Vue {{{1
    local function on_new_config(config, root_dir)
      config.init_options.typescript.tsdk = os.getenv('HOME') .. '/.config/yarn/global/node_modules/typescript/lib'

      local project_path = util.path.join(root_dir, 'node_modules', 'typescript', 'lib')
      if util.path.exists(project_path) then
        config.init_options.typescript.tsdk = project_path
      end
    end

    lspconfig.tsserver.setup({
      filetypes = { 'typescript', 'javascript', 'vue' },
      on_attach = on_attach,
      capabilities = capabilities,
      on_new_config = on_new_config,
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = os.getenv('HOME') .. '/.config/yarn/global/node_modules/@vue/language_server',
            languages = { 'vue' },
          },
        },
      },
    })

    lspconfig.volar.setup({
      capabilities = capabilities,
      on_new_config = on_new_config,
    })

    -- LUA {{{1
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              '${3rd}/luv/library',
            },
          },
        },
      },
    })

    -- GDScript {{{1
    lspconfig.gdscript.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
