local function is_in_git_project()
  return vim.fn.isdirectory('.git') == 1
end

return {
	{ 
    'tpope/vim-fugitive',
    cond = is_in_git_project,
  },
	{ 
    'mhinz/vim-signify',
    cond = is_in_git_project,
    config = function()
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
    end,
  },
}
