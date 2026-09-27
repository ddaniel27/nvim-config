local M = {}

local function is_test_file()
  local file = vim.fn.expand('%')
  if #file <= 1 then
    vim.notify('no buffer name', vim.log.levels.ERROR)
    return
  end
  local is_test = string.find(file, '_test%.go$')
  local is_source = string.find(file, '%.go$')
  return file, (not is_test and is_source), is_test
end

local function alternate()
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
  local alt_file = alternate()
  if not vim.fn.filereadable(alt_file) and not vim.fn.bufexists(alt_file) then
    vim.notify("couldn't find " .. alt_file, vim.log.levels.ERROR)
    return
  else
    local ocmd = 'e ' .. alt_file
    vim.cmd(ocmd)
  end
end

function M.get_go_test_name()
  local tests_query = require('ts_queries.go_test').test_func_name
  
  local stop_row = vim.api.nvim_win_get_cursor(0)[1]
  local parser = vim.treesitter.get_parser(0)
  local root = (parser:parse()[1]):root()
  local test_query = vim.treesitter.query.parse('go', tests_query)

  local name

  for _, match, _ in test_query:iter_matches(root, 0, 0, stop_row, {all = true}) do
    for id, nodes in pairs(match) do
      for _, node in pairs(nodes) do
        if test_query.captures[id] == "testname" then
          name = vim.treesitter.get_node_text(node, 0)
        end
      end
    end
  end
  
  return name
end

-- function M.run_test()
--   local test_name = M.get_go_test_name()
--   if test_name == nil or test_name == "" then
--     vim.notify("error getting test name", vim.log.levels.ERROR)
--     return
--   end
-- end   

return M
