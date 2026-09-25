require('nvim-tree').setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
