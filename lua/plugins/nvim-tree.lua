return {
	{
		'nvim-tree/nvim-tree.lua',
		opts = {
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
	}
}
