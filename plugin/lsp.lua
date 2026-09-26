vim.lsp.config('julials', {
    cmd = {
        "julia",
        "--project=@nvim-lspconfig",
        "--startup-file=no",
        "--history-file=no",
        "-e",
        [[
        using LanguageServer
        project_path = let
            dirname(something(
              Base.load_path_expand((p = get(ENV, "JULIA_PROJECT", nothing); p === nothing ? nothing : isempty(p) ? nothing : p)),
              Base.current_project(),
              get(Base.load_path(), 1, nothing),
              Base.load_path_expand("@v#.#")
            ))
          end
        server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path)
        run(server)
        ]]
    },
    filetypes = { 'julia' },
    root_markers = { "Project.toml", "JuliaProject.toml" },
})

vim.lsp.config('zls', {
  cmd = { 'zls' },
  filetypes = { 'zig' },
  root_markers = { 'build.zig', '.git' },
  single_file_support = true,
  settings = {
  },
})

vim.lsp.enable({'zls', 'julials'})

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

vim.lsp.codelens.enable(true)
vim.lsp.enable('gopls')   

-- Disable inlay_hint
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.lsp.inlay_hint.enable(false)
  end,
})
