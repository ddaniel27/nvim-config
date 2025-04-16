return {
	{
		'leoluz/nvim-dap-go',
		config = function() 
			local dap_go = require('dap-go')
			local dap = require('dap')

      vim.api.nvim_set_hl(0, "sage_green", {
        fg = "#88B378",
        bg = "NONE",
        bold = true,
      })

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'sage_green', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped',   { text = '', texthl = 'sage_green', linehl = '', numhl = '' })

			-- For Go setup
			dap_go.setup()

			-- For container debugging (linux)
			table.insert(dap.configurations.go, {
				type = 'delve',
				name = 'Container debugging (/wd:34567)',
				mode = 'remote',
				request = 'attach',
				substitutePath = {
					{ from = '${workspaceFolder}', to = '/wd' },
				},
			})

			-- For LEA (macOS)
			table.insert(dap.configurations.go, {
				type = 'delvelea',
				name = 'LEA CONTAINER debugging',
				mode = 'remote',
				request = 'attach',
				substitutePath = {
					{ from = '/opt/homebrew/Cellar/go/1.23.1/libexec', to = '/usr/local/go'},
					{ from = '${workspaceFolder}', to = '/lxa' },
				},
			})

			-- For BFF (macOS)
			table.insert(dap.configurations.go, {
				type = 'delvebff',
				name = 'BFF CONTAINER debugging',
				mode = 'remote',
				request = 'attach',
				substitutePath = {
					{ from = '/opt/homebrew/Cellar/go/1.23.1/libexec', to = '/usr/local/go'},
					{ from = '${workspaceFolder}', to = '/lxa' },
				},
			})

			-- For LEA (macOS)
			table.insert(dap.configurations.go, {
				type = 'delvelea',
				name = 'LEA LOCAL debugging',
				mode = 'remote',
				request = 'attach',
			})

			-- For BFF (macOS)
			table.insert(dap.configurations.go, {
				type = 'delvebff',
				name = 'BFF LOCAL debugging',
				mode = 'remote',
				request = 'attach',
			})

			-- Adapters setup
			dap.adapters.delve = {
				type = 'server',
				host = 'localhost',
				port = '34567'
			}

			dap.adapters.delvelea = {
				type = 'server',
				host = '127.0.0.1',
				port = '2345'
			}

			dap.adapters.delvebff = {
				type = 'server',
				host = '127.0.0.1',
				port = '2346'
			}
		end,
		dependencies = {
			{ 'mfussenegger/nvim-dap' },
			{ 'nvim-neotest/nvim-nio' },
			{ 
        'rcarriga/nvim-dap-ui',
        opts = {
          layouts = {
            {
              elements = {
                {
                  id = 'scopes',
                  size = 0.35
                },
                {
                  id = 'breakpoints',
                  size = 0.30,
                },
                {
                  id = 'repl',
                  size = 0.35,
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
