-- Establish local variables to avoid global lookups
local set = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--
-- Establecer el líder de mapa a un espacio
vim.g.mapleader = ' '

-- Mapeos generales
set('n', '<Leader>l', ':nohlsearch<CR>', opts)
set('n', '<Leader>t', ':tabnew term://zsh<CR>A', opts)
set('n', '<A-h>', '<C-W><', opts)
set('n', '<A-j>', '<C-W>-', opts)
set('n', '<A-k>', '<C-W>+', opts)
set('n', '<A-l>', '<C-W>>', opts)
set('n', '<C-h>', '<C-w>h', opts)
set('n', '<C-j>', '<C-w>j', opts)
set('n', '<C-k>', '<C-w>k', opts)
set('n', '<C-l>', '<C-w>l', opts)
set('n', 'ZA', ':tabo<CR>', opts)
set('t', '<Esc><Esc>', '<C-\\><C-n>', opts)

-- Mapeos Tabby
set('n', '<C-x>', ':tabn<CR>', opts)
set('n', '<C-z>', ':tabp<CR>', opts)
set('n', '<Leader>k', ':+tabmove<CR>', opts)
set('n', '<Leader>j', ':-tabmove<CR>', opts)

-- Mapeos NvimTree
set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>', opts)

-- Mapeo Fugitive
set('n', '<Leader>g<CR>', ':G<CR>', opts)

-- Mapeos FZF
set('n', '<Leader>p', ':Files<CR>', opts)
set('n', '<Leader>P', ':Rg<CR>', opts)
set('n', '<Leader>b', ':History<CR>', opts)

-- Mapeos específicos de Go (usando autocmd)
vim.api.nvim_command([[
  autocmd FileType go nmap <buffer> <F3> :GoTestFunc<CR>
  autocmd FileType go nmap <buffer> <F2> :GoCoverage -p <CR>
]])
