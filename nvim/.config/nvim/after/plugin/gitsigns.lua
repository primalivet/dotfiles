require'gitsigns'.setup{
	signs = {
		add          = { text = '+' },
		change       = { text = '~' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = ' ' },
	},
	signs_staged_enable = false,
	preview_config = {
		border = 'double'
	}
}
