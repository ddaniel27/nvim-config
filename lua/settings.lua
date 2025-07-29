vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.clipboard:append('unnamedplus')
vim.opt.encoding = 'utf-8'
vim.opt.showmatch = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.showmode = false
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.showtabline = 2
vim.opt.background = 'dark'
vim.opt.mouse = ''

-- General LSP settings
vim.lsp.inlay_hint.enable(false)

-- colorscheme configs
vim.cmd('colorscheme eldritch')
vim.cmd('syntax enable')

require('transparent').clear_prefix('NvimTree')
require('transparent').clear_prefix('NormalFloat')
require('transparent').clear_prefix('FloatBorder')
require('transparent').clear_prefix('FzfLua')


-- Green symbols (new lines)
vim.api.nvim_set_hl(
  0,
  'SignifySignAdd',
  { fg = '#00ff00', bg = 'NONE', bold = true }
)

-- Yellow symbols (line changes)
vim.api.nvim_set_hl(
  0,
  'SignifySignChange',
  { fg = '#ffff00', bg = 'NONE', bold = true }
)

-- Red symbols (line deleted)
vim.api.nvim_set_hl(
  0,
  'SignifySignDelete',
  { fg = '#ff0000', bg = 'NONE', bold = true }
)
