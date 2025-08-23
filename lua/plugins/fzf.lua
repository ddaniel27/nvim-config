return {
	{
		'ibhagwan/fzf-lua',
    config = function()
      local actions = require('fzf-lua.actions')
      require('fzf-lua').setup({
			winopts = {
				height = 0.20,
				width = 1,
				row = 1,
				border = 'none',
				preview = {
					hidden = 'hidden',
				},
			},
      file_ignore_patterns = {
        "node_modules/",
        ".obsidian/",
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
      keymap = {
        fzf = {
          ['ctrl-e'] = 'abort',
        },
      },
		})
    end,
		dependencies = {
			{
				'junegunn/fzf',
				build = './install --bin'
			},
		},
	}
}
