local function set_signify_hightlights()
  -- Green symbols (new lines)
  vim.api.nvim_set_hl(
    0,
    'SignifySignAdd',
    { fg = '#00ff00', bg = 'NONE', bold = true }
  )

  -- Yellow symbols (line changes)
  vim.api.nvim_set_hl(
    0,
    'SignifySignChange',
    { fg = '#ffff00', bg = 'NONE', bold = true }
  )

  -- Red symbols (line deleted)
  vim.api.nvim_set_hl(
    0,
    'SignifySignDelete',
    { fg = '#ff0000', bg = 'NONE', bold = true }
  )
end

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = set_signify_hightlights,
})
