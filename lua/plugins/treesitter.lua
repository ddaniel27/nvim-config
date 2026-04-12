local ts_ensure_installed = { 'go', 'javascript', 'typescript', 'json', 'lua', 'html', 'rust', 'yaml', 'vim', 'markdown', 'markdown_inline', 'sql', 'zig'}

vim.api.nvim_create_autocmd({ 'Filetype' }, {
  pattern = ts_ensure_installed,
  callback = function(event)
    local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')

    -- no nvim-treesitter, maybe fresh install
    if not ok then return end
    
    local parsers = require('nvim-treesitter.parsers')

    -- not installed and not nvim-treesitter install
    if not parsers[event.match] or not nvim_treesitter.install then return end

    local ft = vim.bo[event.buf].ft
    local lang = vim.treesitter.language.get_lang(ft)
    nvim_treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify('Treesitter install error for ft: '..ft..' err: '..err)
        return
      end

      pcall(vim.treesitter.start, event.buf)
    end)
  end,
})

return {
  -- Still needed?
  -- Keeping to handle parsers and queries
	{
		'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
		build = ':TSUpdate',
    config = function()
    end,
	},
}
