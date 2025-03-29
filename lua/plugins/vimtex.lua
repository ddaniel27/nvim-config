return {
	{
		'lervag/vimtex',
		init = function()
			vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-interaction=nonstopmode',
          '-synctex=1',
        }
      }
		end,
	}
}
