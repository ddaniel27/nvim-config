local ts_ensure_installed = { 'arduino', 'go', 'javascript', 'typescript', 'json', 'lua', 'html', 'rust', 'yaml', 'vim', 'markdown', 'markdown_inline', 'sql', 'zig', 'tex' }

vim.api.nvim_create_autocmd({ 'Filetype' }, {
  pattern = ts_ensure_installed,
  callback = function(event)
    vim.treesitter.start()
  end,
})

return {
  -- Still needed?
  -- Keeping to handle parsers and queries
	{
		'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
		build = ':TSUpdate',
    config = function()
    end,
	},
}
