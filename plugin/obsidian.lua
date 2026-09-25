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


vim.api.nvim_create_user_command('Obsidian', function()
  -- to use in other machines
  local path = '/tickets/Tickets.md'
  if vim.env.MACHINE_ENV == 'personal' then
    path = '/todo/TO-DO.md'
  end

  vim.cmd('cd ' .. obsidian_config['default_workspace'])
  vim.cmd('edit ' .. obsidian_config['default_workspace'] .. path)
end, {})

local function obsidian_setup() 
  require('obsidian').setup({
    daily_notes = {
      folder = 'notes/dailies',
    },
    ui = {
      enable = false,
    },
    legacy_commands = false,
    workspaces = obsidian_config['workspaces'],
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
  })
end

vim.api.nvim_create_autocmd({
  'BufReadPre',
  'BufNewFile',
}, {
  once = true,
  pattern = root_path .. '/*.md',
  callback = function()
    vim.pack.add({
      { src = 'https://github.com/obsidian-nvim/obsidian.nvim' },
    })
    obsidian_setup()
  end
})
