return {
  -- 'yuukiflow/Arduino-Nvim',
  dir = vim.fn.expand('$HOME') .. '/personal/Arduino-Nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  ft = 'arduino',
  lazy = true,
  opts = {
    picker_backend = 'fzf'
  },
}
