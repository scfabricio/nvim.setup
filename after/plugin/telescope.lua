require('telescope').setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "^%.git/" },
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
      '--hidden',
			'--smart-case',
			'--glob=!node_modules/**', -- Ignora `node_modules` ao usar live_grep
      '--glob=!.git/**'
		},
	},
});

