return {
	{
		'ray-x/navigator.lua',
		opts = {
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
		},
		dependencies = {
			{ 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
			{ 'ray-x/go.nvim' },
			{ 'neovim/nvim-lspconfig' },
		},
	}
}
