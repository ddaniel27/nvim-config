local obsidian_config = require('plugins.obsidian')

-- Highlight block yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup= 'IncSearch', timeout= 300 }
  end,
})

-- Auto format go files when saved
local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

-- Function to open obsidia with command
vim.api.nvim_create_user_command('Obsidian', function()
  -- to use in other machines
  local path = '/tickets/Tickets.md'
  if vim.env.MACHINE_ENV == 'personal' then
    path = '/todo/TO-DO.md'
  end

  vim.cmd('cd ' .. obsidian_config.default_workspace)
  vim.cmd('edit ' .. obsidian_config.default_workspace .. path)
end, {})
