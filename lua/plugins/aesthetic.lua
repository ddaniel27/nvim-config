return {
	{ 'eldritch-theme/eldritch.nvim' },
	{ 'nyoom-engineering/oxocarbon.nvim' },
	{ 
		'xiyaowong/transparent.nvim',
		build = ':TransparentEnable',
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
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
		},
	},
	{
		'nanozuki/tabby.nvim',
		config = function() 
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

			require('tabby.tabline').set(function(line)
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
			end)
		end,
	},
}
