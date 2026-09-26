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

