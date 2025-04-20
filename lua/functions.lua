vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup= 'IncSearch', timeout= 300 }
  end,
})

local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

function ToggleCopilot()
    local current_value = vim.g.copilot_enabled or false
    vim.g.copilot_enabled = not current_value

    if vim.g.copilot_enabled then
      print('Copilot Enabled')
    else
      print('Copilot Disabled')
    end
end
