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
            key = 'gd',
            func = require('navigator.definition').definition,
            desc = 'definition',
          },
          {
            key = 'gp',
            func = require('navigator.definition').definition_preview,
            desc = 'preview definition',
          },
          {
            key = 'gP',
            func = require('navigator.definition').type_definition_preview,
            desc = 'preview type definition',
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
