if vim.env.MACHINE_ENV == 'personal' then
  vim.api.nvim_create_autocmd('FileType', {
    once = true,
    pattern = 'arduino',
    callback = function()
      vim.pack.add({
        { src = 'https://github.com/yuukiflow/Arduino-Nvim' },
      })

      require('Arduino-Nvim').setup({
        picker_backend = 'fzf',
      })

    end
  })
end

