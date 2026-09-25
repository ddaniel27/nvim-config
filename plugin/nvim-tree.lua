-- Treefile
vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

require('nvim-tree').setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
