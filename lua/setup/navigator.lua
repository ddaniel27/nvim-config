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
    },
    {
      key = "gd",
      func = require('navigator.definition').definition,
      desc = "definition",
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

require('go').setup({
  dap_debug_vt = false,
  dap_debug_gui = {
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.35
          },
          {
            id = "breakpoints",
            size = 0.30,
          },
          {
            id = "repl",
            size = 0.35,
          },
        },
        position = "right",
        size = 30,
      },
    },
  },
})
