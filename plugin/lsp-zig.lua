vim.lsp.config('zls', {
  cmd = { 'zls' },
  filetypes = { 'zig' },
  root_markers = { 'build.zig', '.git' },
  single_file_support = true,
  settings = {
  },
})

