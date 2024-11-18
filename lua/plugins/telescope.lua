return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require("telescope.builtin")
		local wk = require("which-key")

		-- Register keymaps for Telescope
		wk.register({
			p = { function() telescope.find_files({ hidden = true, no_ignore = true }) end, "Find Files" },
			F = { function() telescope.live_grep({ hidden = false, no_ignore = false }) end, "Find Everywhere" }
		}, { prefix = "<leader>" })
	end
}

