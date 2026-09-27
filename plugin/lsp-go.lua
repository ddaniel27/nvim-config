vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod' },
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = false,
      completeUnimported = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
        useany = true,
        ST1000 = false,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = true,           -- default: true
        regenerate_cgo = true,     -- default: true
        run_govulncheck = true,    -- default: true
        tidy = true,               -- default: true
        upgrade_dependency = true, -- default: true
        vendor = true,             -- default: true
        test = true,               -- default: false
        vulncheck = false,         -- experimental, default: false
      },
      semanticTokens = true,
    },
  },
})
