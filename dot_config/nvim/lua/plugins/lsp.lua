return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

    local win_style = { border = 'rounded' }
    vim.diagnostic.config({ float = win_style, virtual_text = { prefix = '●', spacing = 4 } })
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, win_style)
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, win_style)

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('vaga-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinitions')
        map('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementions')
        map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        map('n', '<leader>k', vim.lsp.buf.signature_help, 'Show signature help')
        map('i', '<C-k>', vim.lsp.buf.signature_help, 'Show signature help')
      end,
    })

    -- Golang {{{1
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    -- PHP {{{1
    lspconfig.intelephense.setup({
      capabilities = capabilities,
    })

    -- Javascript, Typescript, Vue {{{1
    lspconfig.ts_ls.setup({
      filetypes = { 'typescript', 'javascript', 'vue' },
      capabilities = capabilities,
      init_options = {
        typescript = {
          tsdk = '',
        },
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = os.getenv('HOME') .. '/.config/yarn/global/node_modules/@vue/typescript-plugin',
            languages = { 'vue', 'typescript', 'javascript' },
          },
        },
      },
    })

    local function on_new_config(config, root_dir)
      config.init_options.typescript.tsdk = os.getenv('HOME') .. '/.config/yarn/global/node_modules/typescript/lib'

      local project_path = util.search_ancestors(root_dir, function(path)
        local lib_path = util.path.join(path, 'node_modules', 'typescript', 'lib')
        return util.path.exists(lib_path)
      end)

      local lib_path = util.path.join(project_path, 'node_modules', 'typescript', 'lib')
      if util.path.exists(lib_path) then
        config.init_options.typescript.tsdk = lib_path
      end
    end

    lspconfig.volar.setup({
      capabilities = capabilities,
      on_new_config = on_new_config,
    })

    -- LUA {{{1
    lspconfig.lua_ls.setup({
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
      capabilities = capabilities,
    })
  end,
}
