local function is_in_git_project()
  return vim.fn.isdirectory('.git') == 1
end

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

vim.pack.add({
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/mhinz/vim-signify' },
},
	{ load = is_in_git_project() }
)

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = set_signify_hightlights,
})
