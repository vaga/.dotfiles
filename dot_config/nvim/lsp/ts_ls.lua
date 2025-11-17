return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'typescript', 'vue' },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  init_options = {
    hostInfo = 'neovim',
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/opt/homebrew/lib/node_modules/@vue/typescript-plugin',
        languages = { 'vue' },
      },
    },
  },
}
