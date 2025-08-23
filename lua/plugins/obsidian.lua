local root_path = vim.fn.expand "~" .. "/personal/vaults/"
local default_workspace = root_path .. "MHEducation"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = {
    "BufReadPre " .. root_path .. "*.md",
    "BufNewFile " .. root_path .. "*.md",
  }, 
  opts = {
    daily_notes = {
      folder = "notes/dailies",
    },
    ui = {
      enable = false,
    },
    legacy_commands = false,
    workspaces = {
      {
        name = "MHEducation",
        path = root_path .. "MHEducation",
      },
      {
        name = "ideas",
        path = root_path .. "ideas",
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
    },
    picker = {
      name = "fzf-lua",
    },
    
    callbacks = {
      post_set_workspace = function(workspace)
        local cwd = vim.fn.getcwd()
        local target = workspace.path.filename

        if cwd ~= target then
          vim.cmd("cd " .. target)
        end
      end,
    },
  },

  -- Custom type to export
  default_workspace = default_workspace,
}
