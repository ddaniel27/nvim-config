-- Establish local variables to avoid global lookups
local set = vim.keymap.set
local opts = { noremap = true, silent = true }
--
-- Set Leader key
vim.g.mapleader = ' '

-- Mappings buf/win manager
set('n', '<Leader>l', ':nohlsearch<CR>', opts)
set('n', '<A-h>', '<C-W><', opts)
set('n', '<A-j>', '<C-W>-', opts)
set('n', '<A-k>', '<C-W>+', opts)
set('n', '<A-l>', '<C-W>>', opts)
set('n', '<C-h>', '<C-w>h', opts)
set('n', '<C-j>', '<C-w>j', opts)
set('n', '<C-k>', '<C-w>k', opts)
set('n', '<C-l>', '<C-w>l', opts)
set('n', 'ZA', ':tabo<CR>', opts)
set('t', '<C-[><C-[>', '<C-\\><C-n>', opts)

-- Mappings tabs
set('n', '<C-x>', ':tabn<CR>', opts)
set('n', '<C-z>', ':tabp<CR>', opts)
set('n', '<Leader>k', ':+tabmove<CR>', opts)
set('n', '<Leader>j', ':-tabmove<CR>', opts)

-- Mappings Navigator and LSP
set('n', 'gd', vim.lsp.buf.definition, opts)
set('n', ']d', function() vim.diagnostic.jump({count=1,float=true}) end, opts)
set('n', '[d', function() vim.diagnostic.jump({count=-1,float=true}) end, opts)
set('n', ']r', require('navigator.treesitter').goto_next_usage, opts)
set('n', '[r', require('navigator.treesitter').goto_previous_usage, opts)


-- |---------- PLUGINS MAPPINGS -----------|
-- Mappings NvimTree
set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>', opts)

-- Mappings Fugitive
set('n', '<Leader>g<CR>', ':G<CR>', opts)

-- Mappings FZF
set('n', '<Leader>p', require('fzf-lua').files, opts)
set('n', '<Leader>P', require('fzf-lua').grep_project, opts)
set('n', '<Leader>b', require('fzf-lua').oldfiles, opts)

-- Mappings Go files (with autocmd)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    set('n', '<F1>', ':GoAlt<CR>', opts)
    set('n', '<F3>', ':GoTestFunc<CR>', opts)
    set('n', '<F4>', function() require('dap').set_breakpoint(vim.fn.input('Condition: ')) end, opts)
    set('n', '<F5>', ':DapToggleBreakpoint<CR>', opts)
    set('n', '<F6>', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, opts)
    set('n', '<F7>', ':DapStepInto<CR>', opts)
    set('n', '<F8>', ':DapStepOver<CR>', opts)
    set('n', '<F9>', ':DapStepOut<CR>', opts)
    set('n', '<F11>', ':DapContinue<CR>', opts)
    set('n', '<F12>', ':DapUiToggle<CR>:DapContinue<CR>', opts)
  end,
})

-- Mappings Tex files (with autocmd)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    local opts = { buffer = true }
    set('n', '<F3>', ':VimtexCompile<CR>', opts)
    set('n', '\\lbi', 'o\\begin{itemize}\n\\end{itemize}<Esc>O\\item <Esc>', opts)
  end,
})
