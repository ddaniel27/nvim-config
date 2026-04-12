local function work_go_dap_config()
			local dap = require('dap')
      local work_configs = {
        -- For CDAPI (macOS)
        {
          type = 'delvelea',
          name = 'CDAPI CONTAINER debugging',
          mode = 'remote',
          request = 'attach',
          substitutePath = {
            { from = '/opt/homebrew/Cellar/go/1.23.1/libexec', to = '/usr/local/go'},
            { from = '${workspaceFolder}', to = '/go/src/github.mheducation.com/MHEducation/dle-course-delivery-api' },
          },
        },

        -- For LEA (macOS)
        {
          type = 'delvelea',
          name = 'LEA CONTAINER debugging',
          mode = 'remote',
          request = 'attach',
          substitutePath = {
            { from = '/opt/homebrew/Cellar/go/1.23.1/libexec', to = '/usr/local/go'},
            { from = '${workspaceFolder}', to = '/lxa' },
          },
        },

        -- For BFF (macOS)
        {
          type = 'delvebff',
          name = 'BFF CONTAINER debugging',
          mode = 'remote',
          request = 'attach',
          substitutePath = {
            { from = '/opt/homebrew/Cellar/go/1.23.1/libexec', to = '/usr/local/go'},
            { from = '${workspaceFolder}', to = '/lxa' },
          },
        },

        -- For LEA (macOS)
        {
          type = 'delvelea',
          name = 'LEA LOCAL debugging',
          mode = 'remote',
          request = 'attach',
        },

        -- For BFF (macOS)
        {
          type = 'delvebff',
          name = 'BFF LOCAL debugging',
          mode = 'remote',
          request = 'attach',
        },
      }

      for _,config in ipairs(work_configs) do
        table.insert(dap.configurations.go, config)
      end

      -- Adapter LEA
			dap.adapters.delvelea = {
				type = 'server',
				host = '127.0.0.1',
				port = '2345'
			}

      -- Adapter BFF
			dap.adapters.delvebff = {
				type = 'server',
				host = '127.0.0.1',
				port = '2346'
			}
end

local function personal_go_dap_config()
			local dap = require('dap')
      local personal_configs = {
        -- For local debugging (linux)
        {
          type = 'delve',
          name = 'Local debugging (:2345)',
          mode = 'remote',
          request = 'attach',
        },

        -- For container debugging (linux)
        {
          type = 'delve',
          name = 'Container debugging (/app:2345)',
          mode = 'remote',
          request = 'attach',
          substitutePath = {
            { from = '${workspaceFolder}', to = '/app' },
          },
        },
      }

      for _,config in ipairs(personal_configs) do
        table.insert(dap.configurations.go, config)
      end

			-- Adapter linux
			dap.adapters.delve = {
				type = 'server',
				host = '127.0.0.1',
				port = '2345'
			}
end

local function load_go_config()
  local dap = require('dap')
  if dap.configurations.go == nil then
    dap.configurations.go = {}
  end

  -- Dap setups
  if vim.env.MACHINE_ENV == 'personal' then
    personal_go_dap_config()
  else
    work_go_dap_config()
  end

end

return {
	{
    'mfussenegger/nvim-dap',
    lazy=true,
    config = function()
      -- Update signs for better visuals
      vim.api.nvim_set_hl(0, 'sage_green', {
        fg = '#88B378',
        bg = 'NONE',
        bold = true,
      })
      vim.fn.sign_define(
        'DapBreakpoint',
        { text = '', texthl = 'sage_green', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapStopped',
        { text = '', texthl = 'sage_green', linehl = '', numhl = '' }
      )

      -- config for specific languages
      local current_filetype = vim.bo.filetype
      if  current_filetype == 'go' then
        load_go_config()
      end

    end,
		dependencies = {
			{ 'nvim-neotest/nvim-nio' },
			{ 
        'rcarriga/nvim-dap-ui',
        opts = {
          layouts = {
            {
              elements = {
                {
                  id = 'scopes',
                  size = 0.85,
                },
                {
                  id = 'breakpoints',
                  size = 0.15,
                },
              },
              position = 'right',
              size = 50,
            },
          },
        },
      },
		},
	}
}
