local config = {}
local root_path = vim.fn.expand '~' .. '/personal/vaults'
local function set_config_values()
  if vim.env.MACHINE_ENV == 'personal' then
    config['default_workspace'] = root_path .. '/ideas'
    config['workspaces'] = {
      {
        name = 'ideas',
        path = root_path .. '/ideas',
      }
    }
  else
    config['default_workspace'] = root_path .. '/MHEducation'
    config['workspaces'] = {
      {
        name = 'MHEducation',
        path = root_path .. '/MHEducation',
      }
    }
  end
end

set_config_values()

return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  event = {
    'BufReadPre ' .. root_path .. '/*.md',
    'BufNewFile ' .. root_path .. '/*.md',
  }, 
  opts = {
    daily_notes = {
      folder = 'notes/dailies',
    },
    ui = {
      enable = false,
    },
    legacy_commands = false,
    workspaces = config['workspaces'],
    picker = {
      name = 'fzf-lua',
    },
    templates = {
      folder = 'templates',
    },

    -- note related funcs
    note_id_func = function(title)
      return title
    end,

    callbacks = {
      post_set_workspace = function(workspace)
        local cwd = vim.fn.getcwd()
        local target = workspace.path.filename

        if cwd ~= target then
          vim.cmd('cd ' .. target)
        end
      end,
    },
  },

  -- Custom type to export
  root_path = root_path,
  default_workspace = config['default_workspace'],
}
