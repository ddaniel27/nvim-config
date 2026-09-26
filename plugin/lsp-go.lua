vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod' },
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = false,
      completeUnimported = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
        useany = true,
        ST1000 = false,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = true,           -- default: true
        regenerate_cgo = true,     -- default: true
        run_govulncheck = true,    -- default: true
        tidy = true,               -- default: true
        upgrade_dependency = true, -- default: true
        vendor = true,             -- default: true
        test = true,               -- default: false
        vulncheck = false,         -- experimental, default: false
      },
      semanticTokens = true,
    },
  },
})

local M = {}

function is_test_file()
  local file = vim.fn.expand('%')
  if #file <= 1 then
    vim.notify('no buffer name', vim.log.levels.ERROR)
    return
  end
  local is_test = string.find(file, '_test%.go$')
  local is_source = string.find(file, '%.go$')
  return file, (not is_test and is_source), is_test
end

function M.alternate()
  local file, is_source, is_test = is_test_file()
  local alt_file = file
  if is_test then
    alt_file = string.gsub(file, '_test.go', '.go')
  elseif is_source then
    alt_file = vim.fn.expand('%:r') .. '_test.go'
  else
    vim.notify('not a go file', vim.log.levels.ERROR)
  end
  return alt_file
end

function M.switch()
  local alt_file = M.alternate()
  if not vim.fn.filereadable(alt_file) and not vim.fn.bufexists(alt_file) then
    vim.notify("couldn't find " .. alt_file, vim.log.levels.ERROR)
    return
  elseif #cmd <= 1 then
    local ocmd = 'e ' .. alt_file
    vim.cmd(ocmd)
  else
    local ocmd = cmd .. ' ' .. alt_file
    vim.cmd(ocmd)
  end
end

return M
