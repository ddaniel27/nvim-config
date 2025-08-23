return {
	{
		'nvim-tree/nvim-tree.lua',
		opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
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
