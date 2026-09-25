local M = {}

function M.is_in_git_project()
  return vim.fn.isdirectory('.git') == 1
end

return M
