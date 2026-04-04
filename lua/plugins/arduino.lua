return {
  "yuukiflow/Arduino-Nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- Load Arduino plugin for .ino files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "arduino",
      callback = function()
        require("Arduino-Nvim")
        require("Arduino-Nvim.lsp").setup()
      end,
    })
  end,
}
