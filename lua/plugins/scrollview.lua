return {
	'dstein64/nvim-scrollview',
	opts = {
		excluded_filetypes = { 'NvimTree', 'neo-tree', 'lazy', 'help' },
		current_only = true,
		winblend = 75,
		base = 'right',
		column = 1,
		diagnostics_severities = { vim.diagnostic.severity.ERROR },
	}
}

