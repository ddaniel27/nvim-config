-- Tabs and lines
vim.pack.add({
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nanozuki/tabby.nvim' },
  { src = 'https://github.com/xiyaowong/transparent.nvim' },
})
-- Themes
vim.pack.add({
  { src = 'https://github.com/eldritch-theme/eldritch.nvim' },
  { src = 'https://github.com/wtfox/luna.nvim' },
  { src = 'https://github.com/kungfusheep/mfd.nvim' },
  { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim' },
})

require('transparent').setup({
  exclude_groups = {
    'CursorLine',
  },
})

require('lualine').setup({
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
})

local theme = {
  fill = 'TabLineFill',
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

local sysname = vim.loop.os_uname().sysname
local os_icon = sysname == 'Linux' and '' or (sysname == 'Darwin' and '' or '')

require('tabby').setup({
  line = function(line)
				return {
					{
						{ ' ' ..os_icon.. ' ', hl = theme.head },
					},
					line.tabs().foreach(function(tab)
						local hl = tab.is_current() and theme.current_tab or theme.tab
						return {
							line.sep(' ', hl, theme.fill),
							tab.is_current() and '' or '',
							tab.name(),
							line.sep(' ', hl, theme.fill),
							hl = hl,
							margin = ' ',
						}
					end),
					line.spacer(),
					hl = theme.fill,
				}
			end,
})
