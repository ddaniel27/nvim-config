local utils = require('utils')

-- Vimpack
-- Dependencies
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/neovim/nvim-lspconfig' }, -- Deprecated (?)
})
require('config.dependencies')

-- Autopairs
vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({
      { src = 'https://github.com/windwp/nvim-autopairs' },
    })
    require('nvim-autopairs').setup()
  end
})

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

-- DBUI plugins
vim.pack.add({
  { src = 'https://github.com/tpope/vim-dadbod' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-completion' }, -- Lazy loading for 'sql', 'mysql', 'plsql'
  { src = 'https://github.com/kristijanhusak/vim-dadbod-ui' },
})
require('config.dbui')

-- Arduino plugins
if vim.env.MACHINE_ENV == 'personal' then
  vim.pack.add({
    { src = 'https://github.com/yuukiflow/Arduino-Nvim' },
  })
  require('config.arduino')
end

-- Blink cmp plugins
vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
})
require('config.blink')


-- Obsidian plugin
vim.api.nvim_create_user_command('Obsidian', function()
  -- to use in other machines
  local path = '/tickets/Tickets.md'
  if vim.env.MACHINE_ENV == 'personal' then
    path = '/todo/TO-DO.md'
  end

  vim.cmd('cd ' .. utils.obsidian_config['default_workspace'])
  vim.cmd('edit ' .. utils.obsidian_config['default_workspace'] .. path)
end, {})

local root_path = vim.fn.expand '~' .. '/personal/vaults'
vim.api.nvim_create_autocmd({
  'BufReadPre',
  'BufNewFile',
}, {
  once = true,
  pattern = root_path .. '/*.md',
  callback = function()
    vim.pack.add({
      { src = 'https://github.com/obsidian-nvim/obsidian.nvim' },
    })
    require('config.obsidian')
  end
})


-- require('functions')
require('settings')
require('mappings')
-- require('config.lazy')
