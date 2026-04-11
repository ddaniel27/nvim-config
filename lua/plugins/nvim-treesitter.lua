return {
  -- Still needed?
	{
		'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    opts = {},
		build = ':TSUpdate',
	},
}
