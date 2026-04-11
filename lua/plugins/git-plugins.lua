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
  },
}
