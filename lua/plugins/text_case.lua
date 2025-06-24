return {
	"johmsalas/text-case.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"stevearc/dressing.nvim", -- optional but recommended
	},
	lazy = false,             -- set true jika kamu ingin lazy load
	config = function()
		require("textcase").setup({})
		require("telescope").load_extension("textcase")
	end,
}
