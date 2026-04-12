local function work_db_config()
  return {
    {
      name = 'lea-local',
      url = function()
        return vim.fn.system('connection-string-lea-local')
      end
    },
    {
      name = 'lea-qastg',
      url = function()
        return vim.fn.system('connection-string-lea-qastg')
      end
    },
    {
      name = 'lea-prod',
      url = function()
        return vim.fn.system('connection-string-lea-prod')
      end
    },
    {
      name = 'assembly-dev',
      url = function()
        return vim.fn.system('connection-string-assembly-dev')
      end
    },
    {
      name = 'assembly-qastg',
      url = function()
        return vim.fn.system('connection-string-assembly-qastg')
      end
    },
    {
      name = 'assembly-prod',
      url = function()
        return vim.fn.system('connection-string-assembly-prod')
      end
    },
  }
end

local function personal_db_config()
  return {}
end
-- TODO: add config for machine env
return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1

      local dbs = {}
      if vim.env.MACHINE_ENV == 'personal' then
        dbs = personal_db_config()
      else
        dbs = work_db_config()
      end

      vim.g.dbs = dbs
    end, 
  },
}
