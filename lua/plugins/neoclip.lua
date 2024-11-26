return {
	{
		"AckslD/nvim-neoclip.lua",
		event = 'VeryLazy',
		dependencies = {
			"nvim-telescope/telescope.nvim",
			{ "kkharji/sqlite.lua", lazy = true }, -- Optional for persistent history
		},
		config = function()
			-- Ensure the directory exists
			local db_dir = vim.fn.stdpath("data") .. "/neoclip" -- Ensure the directory exists
			vim.fn.mkdir(db_dir, "p")                        -- Creates the directory if it doesn't exist

			-- Set the db_path to the SQLite file within that directory
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = true,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				default_register = { '"', "+", "*" },
				keys = {
					telescope = {
						i = {
							select = "<cr>",
							paste = "<cr>", -- Automatically pastes on select
							paste_behind = "<c-k>",
						},
						n = {
							select = "<cr>",
							paste = "p", -- Automatically pastes on select
							paste_behind = "P",
						},
					},
				},
			})
			require("telescope").load_extension("neoclip")
		end,
	},
}
