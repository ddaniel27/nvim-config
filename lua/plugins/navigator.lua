return {
	{
		'ray-x/navigator.lua',
    config = function()
      require('navigator').setup({
        keymaps = {
          {
            key = '<Leader><c-k>',
            func = vim.lsp.buf.signature_help,
            desc = 'signature help',
          },
          {
            key = '<Leader>+',
            func = require('navigator.dochighlight').hi_symbol,
            desc = 'highlight symbol',
          },
          {
            key = 'gd',
            func = require('navigator.definition').definition,
            desc = 'definition',
          },
          {
            key = 'K',
            func = function()
              vim.lsp.buf.hover({
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
              })
            end,
            desc = 'hover'
          }
        },
        lsp_signature_help = false,
        lsp = {
          document_highlight = false,
          format_on_save = false,
          code_lens_action = { enable = false, },
          diagnostic = { virtual_text = false },
          hover = { enable = false },
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
        opts = {
          lsp_cfg = {}
        },
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
