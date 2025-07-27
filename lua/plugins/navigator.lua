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
            key = 'grn',
            func = vim.lsp.buf.rename,
            desc = 'rename',
          },
          { 
            key = ']d',
            func = require('navigator.diagnostics').goto_next,
            desc = 'next diagnostics error or fallback',
          },
          { 
            key = '[d',
            func = require('navigator.diagnostics').goto_prev,
            desc = 'prev diagnostics error or fallback',
          },
          { 
            key = ']r',
            func = require('navigator.treesitter').goto_next_usage,
            desc = 'goto_next_usage',
          },
          { 
            key = '[r',
            func = require('navigator.treesitter').goto_previous_usage,
            desc = 'goto_previous_usage',
          },
          { 
            key = '<Space>ca',
            func = require('navigator.codeAction').code_action,
            desc = 'code_action',
            mode = { 'n', 'v' },
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
