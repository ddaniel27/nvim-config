vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.clipboard:append('unnamedplus')
vim.opt.encoding = 'utf-8'
vim.opt.showmatch = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.showtabline = 2
vim.opt.background = 'dark'
vim.opt.mouse = ''

-- Disable copilot by default
vim.g.copilot_enabled = false

vim.cmd('colorscheme eldritch')
vim.cmd('syntax enable')
require('transparent').clear_prefix('NvimTree')
