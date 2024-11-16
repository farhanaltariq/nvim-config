return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
		"nvim-treesitter/nvim-treesitter"
	},

	config = function ()
		local highlight = {
    "RainbowCyan",
    "RainbowBlue",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowYellow",
    "RainbowOrange",
		}

		local hooks = require "ibl.hooks"
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		end)

		require("ibl").setup { indent = { highlight = highlight } }
	end
}
