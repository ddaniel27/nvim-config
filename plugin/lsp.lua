-- Disable inlay_hint
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.lsp.inlay_hint.enable(false)
  end,
})
