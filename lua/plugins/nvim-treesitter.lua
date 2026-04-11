return {
  -- Still needed?
  -- Keeping to handle parsers and queries
	{
		'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    opts = {},
		build = ':TSUpdate',
	},
}
