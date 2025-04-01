return {
	{
		'ray-x/navigator.lua',
    config = function()
      require('navigator').setup({
        keymaps = {
          {
            key = '<Leader><c-k>',
            func = vim.lsp.buf.signature_help,
            desc = 'test',
          },
          {
            key = '<Leader>+',
            func = require('navigator.dochighlight').hi_symbol,
            desc = 'highlight symbol',
          },
          {
            key = 'gi',
            func = require('navigator.implementation').implementation_call(),
            desc = 'implementation',
          },
        },
        lsp = {
          format_on_save = false,
          code_action = {
            enable = true,
          },
          code_lens_action = {
            enable = false,
          },
          gopls = {
            settings = {
              gopls = {
                usePlaceholders = false,
              },
            },
          },
          rust_analyzer = {
            settings = {
              ['rust-analyzer'] = {
                diagnostics = {
                  disabled = { 'unlinked-file' },
                },
              }
            }
          },
        },
		})
    end,
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 
        'ray-x/go.nvim',
        opts = {},
      },
			{ 
        'ray-x/guihua.lua', 
        build = 'cd lua/fzy && make',
        config = function()
          require('guihua.maps').setup({
            maps = {
              prev = '<C-k>',
              next = '<C-j>',
            }
          })
        end,
      },
		},
	}
}
