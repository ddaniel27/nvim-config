vim.api.nvim_create_autocmd('FileType', {
  once = true,
  pattern = 'tex',
  callback = function()
    vim.pack.add({
      { src = 'https://github.com/lervag/vimtex' },
    })

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
  end
})
