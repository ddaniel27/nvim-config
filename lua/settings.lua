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

-- TODO: check if this still needed
if vim.env.MACHINE_ENV ~= 'personal' then
  require('transparent').clear_prefix('NvimTree')
  require('transparent').clear_prefix('NormalFloat')
  require('transparent').clear_prefix('FloatBorder')
  require('transparent').clear_prefix('FzfLua')
end
