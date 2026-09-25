utils = require('utils')

require('obsidian').setup({
    daily_notes = {
      folder = 'notes/dailies',
    },
    ui = {
      enable = false,
    },
    legacy_commands = false,
    workspaces = utils.obsidian_config['workspaces'],
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
