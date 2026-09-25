local utils = require('utils')

-- Vimpack
-- Dependencies
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/neovim/nvim-lspconfig' }, -- Deprecated (?)
})
require('config.dependencies')

-- ***Aesthetic***
-- Tabs and lines
vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nanozuki/tabby.nvim' },
  { src = 'https://github.com/xiyaowong/transparent.nvim' },
})
-- Themes
vim.pack.add({
  { src = 'https://github.com/eldritch-theme/eldritch.nvim' },
  { src = 'https://github.com/wtfox/luna.nvim' },
  { src = 'https://github.com/kungfusheep/mfd.nvim' },
  { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim' },
})
require('config.aesthetic')

-- Treefile
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})
require('config.nvim-tree')

-- Git plugins
vim.pack.add({
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/mhinz/vim-signify' },
},
	{ load = utils.is_in_git_project() }
)
require('config.git')

-- FZF Plugins
vim.pack.add({
  { src = 'https://github.com/ibhagwan/fzf-lua' },
})
require('config.fzf')

-- Navigator plugins
vim.pack.add({
  { src = 'https://github.com/ray-x/guihua.lua' },
  { src = 'https://github.com/ray-x/go.nvim' },
  { src = 'https://github.com/ray-x/navigator.lua' },
})
require('config.navigator')

-- DAP plugins
vim.pack.add({
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/mfussenegger/nvim-dap' },
})
require('config.dap')

-- require('functions')
require('settings')
require('mappings')
-- require('config.lazy')
