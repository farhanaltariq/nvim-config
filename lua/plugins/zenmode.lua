-- Lua
return {
	"folke/zen-mode.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	window = {
		backdrop = 0.85, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
	},
	plugins = {
		-- disable some global vim options (vim.o...)
		-- comment the lines to not apply the options

		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
			-- you may turn on/off statusline in zen mode by setting 'laststatus'
			-- statusline will be shown only if 'laststatus' == 3
			laststatus = 0, -- turn off the statusline in zen mode
		},

		twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
		tmux = { enabled = false },   -- disables the tmux statusline
		todo = { enabled = true },    -- if set to "true", todo-comments.nvim highlights will be disable
	}
}
