local dap_go = require('dap-go')
local dap = require('dap')
local dap_ui = require('dapui')

dap_go.setup()
table.insert(dap.configurations.go, {
  type = 'delve',
  name = 'Container debugging (/wd:34567)',
  mode = 'remote',
  request = 'attach',
  substitutePath = {
    { from = '${workspaceFolder}', to = '/wd' },
  },
})

dap.adapters.delve = {
  type = 'server',
  host = 'localhost',
  port = '34567'
}

dap_ui.setup({
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.35
        },
        {
          id = "breakpoints",
          size = 0.30,
        },
        {
          id = "repl",
          size = 0.35,
        },
      },
      position = "right",
      size = 50,
    },
  },
})
