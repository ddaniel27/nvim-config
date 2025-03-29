return {
	{ 'tpope/vim-fugitive' },
	{ 
    'mhinz/vim-signify',
    config = function()
      vim.api.nvim_set_hl(
        0,
        'SignifySignAdd',
        { fg = '#00ff00', bg = 'NONE', bold = true }
      )

      vim.api.nvim_set_hl(
        0,
        'SignifySignChange',
        { fg = '#ffff00', bg = 'NONE', bold = true }
      )

      vim.api.nvim_set_hl(
        0,
        'SignifySignDelete',
        { fg = '#ff0000', bg = 'NONE', bold = true }
      )
    end
  }
}
