return {
	{
		"atiladefreitas/lazyclip",
		event = 'VeryLazy',
		config = function()
			require("lazyclip").setup()
		end,
		keys = {
			{ "<leader>v", ":lua require('lazyclip').show_clipboard()<CR>", desc = "Open Clipboard Manager" },
		},
	},
}

