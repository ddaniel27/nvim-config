require('lualine').setup{
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = '•'
        }
      },
    },
  },
  options = {
    globalstatus = true,
  },
}
