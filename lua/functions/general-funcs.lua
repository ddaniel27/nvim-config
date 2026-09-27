local ts_ensure_installed = { 
  'arduino',
  'go',
  'javascript',
  'typescript',
  'json',
  'lua',
  'html',
  'rust',
  'yaml',
  'vim',
  'markdown',
  'markdown_inline',
  'sql',
  'zig',
  'tex',
}

-- Highlight block yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup= 'IncSearch', timeout= 300 }
  end,
})

-- Start treesitter
vim.api.nvim_create_autocmd({ 'Filetype' }, {
  pattern = ts_ensure_installed,
  callback = function(event)
    vim.treesitter.start()
  end,
})

-- Auto format go files when saved
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {'*.go', '*.zig', '*.jl'},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
