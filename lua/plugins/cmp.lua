return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
      keymap = { 
        preset = 'none',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },
      },

      cmdline = {
        completion = { menu = { auto_show = true } },
        keymap = {
          preset = 'none',
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
          ['<C-j>'] = { 'select_next' },
          ['<C-k>'] = { 'select_prev' },
          ['<Tab>'] = { 'insert_next' },
          ['<S-Tab>'] = { 'insert_prev' },
        },
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = { documentation = { auto_show = false } },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
      -- signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}
