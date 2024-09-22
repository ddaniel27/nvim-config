return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function ()
			require 'nvim-treesitter.install'.compilers = { 'clang' }
			require('nvim-treesitter.configs').setup{
				auto_install = false,
				highlight = {
					enable = true,
				},
			}
		end,
		build = ':TSUpdate',
	}
}
