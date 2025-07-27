local border_style = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

return {
	{
		'ray-x/navigator.lua',
    config = function()
      require('navigator').setup({
        default_mapping = false,
        keymaps = {
          {
            key = 'gd',
            func = require('navigator.definition').definition,
            desc = 'definition',
          },
          {
            key = 'gi',
            func = require('navigator.implementation').implementation,
            desc = 'implementation',
          },
          { 
            key = 'grr',
            func = require('navigator.reference').async_ref,
            desc = 'async_ref',
          },
          { 
            key = 'gp',
            func = require('navigator.definition').definition_preview,
            desc = 'definition_preview',
          },
          { 
            key = 'gP',
            func =  require('navigator.definition').type_definition_preview,
            desc = 'type_definition_preview',
          },
          { 
            key = '<Leader>gi',
            func = require('navigator.hierarchy').incoming_calls,
            desc = 'incoming_calls',
          },
          {
            key = 'K',
            func = function()
              vim.lsp.buf.hover({
                border = border_style,
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
        },
		})
    end,
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 
        'ray-x/go.nvim',
        opts = {
          lsp_cfg = {
            settings = {
              gopls = {
                usePlaceholders = false,
              },
            },
          },
          lsp_keymaps = false,
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
