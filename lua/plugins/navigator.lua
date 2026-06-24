return {
	{
		'ray-x/navigator.lua',
    config = function()
      require('navigator').setup({
        default_mapping = false,
        lsp = {
          document_highlight = true,
          format_on_save = false,
          diagnostic = { virtual_text = false },
          disable_lsp = {'yamlls'},
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
