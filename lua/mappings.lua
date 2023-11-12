-- Establecer el líder de mapa a un espacio
vim.g.mapleader = ' '

-- Mapeos generales
-- vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':nohlsearch<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew term://zsh<CR>A', { silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', '<C-W><', { silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-W>-', { silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-W>+', { silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-W>>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('n', 'ZA', ':tabo<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { silent = true })

-- Mapeos Tabby
vim.api.nvim_set_keymap('n', '<C-x>', ':tabn<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-z>', ':tabp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':+tabmove<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':-tabmove<CR>', { silent = true })

-- Configuración de NvimTree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true })

-- Mapeo Fugitive
vim.api.nvim_set_keymap('n', '<Leader>g', ':G', { silent = true })

-- Mapeos FZF
vim.api.nvim_set_keymap('n', '<Leader>p', ':Files<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>P', ':Rg<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':History<CR>', { silent = true })

-- Mapeos específicos de Go (usando autocmd)
vim.api.nvim_command([[
  autocmd FileType go nmap <buffer> <F3> :GoTestFunc<CR>
  autocmd FileType go nmap <buffer> <F2> :GoCoverage -p <CR>
]])
