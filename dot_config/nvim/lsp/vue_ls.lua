return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  root_markers = { 'package.json' },
  -- https://github.com/vuejs/language-tools/blob/master/packages/language-server/lib/types.ts
  init_options = {
    typescript = {
      tsdk = os.getenv('HOME') .. '/.config/yarn/global/node_modules/typescript/lib',
    },
  },
  before_init = function(_, config)
    local lib_path = vim.fs.find('node_modules/typescript/lib', { path = config.root_dir, upward = true })[1]
    if lib_path then
      config.init_options.typescript.tsdk = lib_path
    end
  end,
}
