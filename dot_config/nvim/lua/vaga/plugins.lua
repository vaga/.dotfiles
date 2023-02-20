local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local import = function(name)
  return string.format('require("%s")', name)
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'gpanders/editorconfig.nvim' }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = import('vaga.plugins.catppuccin'),
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'nvim-lua/plenary.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = import('vaga.plugins.lsp'),
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    config = import('vaga.plugins.cmp'),
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = import('vaga.plugins.treesitter'),
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = import('vaga.plugins.telescope'),
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = import('vaga.plugins.lualine'),
  }
end)
