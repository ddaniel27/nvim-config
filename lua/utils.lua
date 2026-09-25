local M = {}

function M.is_in_git_project()
  return vim.fn.isdirectory('.git') == 1
end

local obsidian_config = {}
local root_path = vim.fn.expand '~' .. '/personal/vaults'
local function set_config_values()
  if vim.env.MACHINE_ENV == 'personal' then
    obsidian_config['default_workspace'] = root_path .. '/ideas'
    obsidian_config['workspaces'] = {
      {
        name = 'ideas',
        path = root_path .. '/ideas',
      }
    }
  else
    obsidian_config['default_workspace'] = root_path .. '/MHEducation'
    obsidian_config['workspaces'] = {
      {
        name = 'MHEducation',
        path = root_path .. '/MHEducation',
      }
    }
  end
end
set_config_values()

M.obsidian_config = obsidian_config

vim.api.nvim_create_user_command('Obsidian', function()
  -- to use in other machines
  local path = '/tickets/Tickets.md'
  if vim.env.MACHINE_ENV == 'personal' then
    path = '/todo/TO-DO.md'
  end

  vim.cmd('cd ' .. M.obsidian_config['default_workspace'])
  vim.cmd('edit ' .. M.obsidian_config['default_workspace'] .. path)
end, {})

return M
