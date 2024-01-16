require('navigator').setup({
  keymaps = {
    {
      key = "<Leader><c-k>",
      func = vim.lsp.buf.signature_help,
      desc = "test",
    },
    {
      key = "<Leader>+",
      func = require('navigator.dochighlight').hi_symbol,
      desc = "highlight symbol",
    }
  },
  lsp = {
    format_on_save = false,
    code_action = {
      enable = true,
    },
    code_lens_action = {
      enable = false,
    },
    gopls = {
      settings = {
        gopls = {
          usePlaceholders = false,
        },
      },
    },
  },
})

require('guihua.maps').setup({
maps = {
  prev = '<C-k>',
  next = '<C-j>',
  }
})

require('go').setup()
