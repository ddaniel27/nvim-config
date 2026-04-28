return {
	{
		'ray-x/navigator.lua',
    config = function()
      require('navigator').setup({
        default_mapping = false,
        lsp_signature_help = false,
        lsp = {
          document_highlight = false,
          format_on_save = false,
          diagnostic = { virtual_text = false },
          zls = {
            filetypes={'zig'},
            settings={
              cmd= {'zls'}
            },
            root_dir = function(fname)
              return util.root_pattern('build.zig')(fname) or dirname(fname)
            end
          }
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
