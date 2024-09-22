return {
	{
		'nvim-tree/nvim-tree.lua',
		config = function() require('setup.nvim-tree') end,
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
	}
}
