return {
	"phaazon/hop.nvim",
	branch = "v2", -- if you're using v2
	config = function()
		local hop = require("hop")
		hop.setup({
			multi_windows = true, -- this makes hop work across splits
		})
	end,
}
