require('guihua.maps').setup({
  maps = {
    prev = '<C-k>',
    next = '<C-j>',
  }
})

require('go').setup({
  lsp_cfg = {
    settings = {
      gopls = {
        usePlaceholders = false,
        analyses = {
          ST1000 = false,
        }
      },
    },
  },
  lsp_keymaps = false,
})

require('navigator').setup({
  default_mapping = false,
  lsp = {
    document_highlight = true,
    format_on_save = false,
    diagnostic = { virtual_text = false },
    disable_lsp = {'yamlls', 'jsonls'},
  },
})

-- Disable inlay_hint
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.lsp.inlay_hint.enable(false)
  end,
})

