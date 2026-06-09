local function should_load()
  if vim.env.MACHINE_ENV ~= 'personal' then
    return {}
  end
  return {
    'yuukiflow/Arduino-Nvim',
    -- dir = vim.fn.expand('$HOME') .. '/personal/Arduino-Nvim',
    ft = 'arduino',
    lazy = true,
    opts = {
      picker_backend = 'fzf'
    },
  }
end

return should_load()
