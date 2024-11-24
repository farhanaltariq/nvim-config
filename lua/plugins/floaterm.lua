return {
	"voldikss/vim-floaterm",
	event = 'VeryLazy',
	cmd = "FloatermToggle",
	config = function()
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_position = 'center'
		vim.g.floaterm_wintitle = 0
		vim.g.floaterm_autoclose = 2
	end
}
