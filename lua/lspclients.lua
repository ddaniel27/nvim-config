-- General LSP settings
vim.lsp.inlay_hint.enable(false)

-- Zig LSP settings
vim.lsp.config['zls'] = {
  cmd= {'zls'},
  filetypes={'zig'},
  root_markers = {'build.zig'},
  workspace_required = false,
}

vim.lsp.enable('zls')
