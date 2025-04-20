-- Establish local variables to avoid global lookups
local set = vim.keymap.set
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
set('n', '<Leader>p', require('fzf-lua').files, opts)
set('n', '<Leader>P', require('fzf-lua').grep_project, opts)
set('n', '<Leader>b', require('fzf-lua').oldfiles, opts)

-- Mapeos de Copilot
set('i', '<C-l>', '<Plug>(copilot-accept-line)', opts)
set('i', '<C-a>', ToggleCopilot, opts)


-- Mapeos específicos de Go (usando autocmd)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    set('n', '<F3>', ':GoTestFunc<CR>', opts)
    set('n', '<F5>', ':DapToggleBreakpoint<CR>', opts)
    set('n', '<F7>', ':DapStepInto<CR>', opts)
    set('n', '<F8>', ':DapStepOver<CR>', opts)
    set('n', '<F9>', ':DapStepOut<CR>', opts)
    set('n', '<F11>', ':DapContinue<CR>', opts)
    set('n', '<F12>', ':DapUiToggle<CR>:DapContinue<CR>', opts)
  end,
})

-- Mapeos específicos de Tex (usando autocmd)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    local opts = { buffer = true }
    set('n', '<F3>', ':VimtexCompile<CR>', opts)
    set('n', '\\lbi', 'o\\begin{itemize}\n\\end{itemize}<Esc>O\\item <Esc>', opts)
  end,
})
