return {
	'kristijanhusak/vim-dadbod-ui',
	event = 'VeryLazy',
	dependencies = {
		{ 'tpope/vim-dadbod',                     lazy = true },
		{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
	},
	cmd = {
		'DBUI',
		'DBUIToggle',
		'DBUIAddConnection',
		'DBUIFindBuffer',
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_use_table_fancy = 1 -- optional for fancy tables
		vim.g.db_ui_save_sessions = true
	end,
}