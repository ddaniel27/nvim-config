require('nvim-autopairs').setup{
  disable_filetype = { "TelescopePrompt" , "guihua", "guihua_rust", "clap_input" },
}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup{
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i'}),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
