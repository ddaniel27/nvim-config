local function get_go_test()
  local tests_query = [[
  (function_declaration
    name: (identifier) @testname
    parameters: (parameter_list
      . (parameter_declaration
        type: (pointer_type) @type) .)
    (#match? @type "*testing.(T|M)")
    (#match? @testname "^Test.+$")) @parent
  ]]
  
  local stop_row = vim.api.nvim_win_get_cursor(0)[1]
  local parser = vim.treesitter.get_parser(0)
  local root = (parser:parse()[1]):root()
  local test_query = vim.treesitter.query.parse('go', tests_query)

  local name

  for _, match, _ in test_query:iter_matches(root, 0, 0, stop_row, {all = true}) do
    for id, nodes in pairs(match) do
      for _, node in pairs(nodes) do
        if test_query.captures[id] == "testname" then
          name = vim.treesitter.get_node_text(node, 0)
        end
      end
    end
  end
  
  return name
end

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

        -- For testing
        {
          type = 'gotest',
          request = 'launch',
          name = 'Testing func',
          mode = 'test',
          program =  './${relativeFileDirname}',
          outputMode = 'remote',
          args = function() return { '-test.run=^'.. get_go_test() ..'$'} end,
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

      dap.adapters.gotest = function(callback, _)
        local stdout = vim.loop.new_pipe(false)
        local handle
        local pid_or_err
        local port = 38697
        local opts = {
          stdio = { nil, stdout },
          args = { "dap", "-l", "127.0.0.1:" .. port },
          detached = true,
        }
        handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
          stdout:close()
          handle:close()
        end)
        assert(handle, "Error running dlv: " .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
          assert(not err, err)
          if chunk then
            vim.schedule(function()
              require("dap.repl").append(chunk)
            end)
          end
        end)
        vim.defer_fn(function()
          callback { type = "server", host = "127.0.0.1", port = port }
        end, 100)
      end
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
      vim.api.nvim_set_hl(0, 'sage_yellow', {
        fg = '#F6C531',
        bg = 'NONE',
        bold = true,
      })
      vim.api.nvim_set_hl(0, 'sage_red', {
        fg = '#AC0715',
        bg = 'NONE',
        bold = true,
      })
      vim.fn.sign_define(
        'DapBreakpointRejected',
        { text = '', texthl = 'sage_red', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapBreakpointCondition',
        { text = '󰯳', texthl = 'sage_green', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapLogPoint',
        { text = '', texthl = 'sage_yellow', linehl = '', numhl = '' }
      )
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
                  id = 'repl',
                  size = 0.20,
                },
                {
                  id = 'scopes',
                  size = 0.65,
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
