vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.clipboard:append("unnamed")
vim.opt.encoding = "utf-8"
vim.opt.showmatch = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.showtabline = 2
vim.opt.background = "dark"
vim.opt.mouse = ""

vim.cmd("colorscheme oxocarbon")
vim.cmd("highlight MiniFilesBorder cterm=bold")
require('transparent').clear_prefix('NvimTree')
