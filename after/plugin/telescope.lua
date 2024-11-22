require('telescope').setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--glob=!node_modules/**' -- Ignora `node_modules` ao usar live_grep
		},
	},
});

