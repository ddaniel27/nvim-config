local actions = require('fzf-lua.actions')

return {
	{
		'ibhagwan/fzf-lua',
		opts = {
			winopts = {
				height = 0.20,
				width = 1,
				row = 1,
				border = 'none',
				preview = {
					hidden = 'hidden',
				},
			},
			fzf_opts = {
				['--layout'] = 'reverse',
			},
			oldfiles = {
				include_current_session = true,
			},
			actions = {
				files = {
					false,
					['ctrl-p'] = actions.file_switch_or_edit,
					['enter'] = actions.file_tabedit,
				},
			},
		},
		dependencies = {
			{
				'junegunn/fzf',
				build = './install --bin'
			},
		},
	}
}
