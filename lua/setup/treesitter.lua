require 'nvim-treesitter.install'.compilers = { "clang" }
require('nvim-treesitter.configs').setup{
  auto_install = true,
  highlight = {
    enable = true,
  },
}
