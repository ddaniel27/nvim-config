return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
      enabled = function() return not vim.tbl_contains({ 'dap-repl' }, vim.bo.filetype) end,
      keymap = { 
        preset = 'none',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },
      },

      cmdline = {
        completion = { menu = { auto_show = true } },
        keymap = {
          preset = 'cmdline',
          ['<Tab>'] = {
            function(cmp)
              if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
            end,
            'select_and_accept',
          },
          ['<C-j>'] = { 'select_next' },
          ['<C-k>'] = { 'select_prev' },
        },
      },

      appearance = { nerd_font_variant = 'mono' },

      completion = { 
        menu = { scrollbar = false },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          sql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },
}
