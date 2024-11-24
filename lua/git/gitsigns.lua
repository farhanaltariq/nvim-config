-- gitsigns
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		-- Set up highlights for gitsigns using the new recommended approach
		local hl = vim.api.nvim_set_hl
		hl(0, "GitSignsAdd", { link = "DiffAdd" })
		hl(0, "GitSignsAddLn", { link = "DiffAdd" })
		hl(0, "GitSignsAddNr", { link = "DiffAdd" })
		hl(0, "GitSignsChange", { link = "DiffChange" })
		hl(0, "GitSignsChangeLn", { link = "DiffChange" })
		hl(0, "GitSignsChangeNr", { link = "DiffChange" })
		hl(0, "GitSignsChangedelete", { link = "DiffChange" })
		hl(0, "GitSignsChangedeleteLn", { link = "DiffChange" })
		hl(0, "GitSignsChangedeleteNr", { link = "DiffChange" })
		hl(0, "GitSignsDelete", { link = "DiffDelete" })
		hl(0, "GitSignsDeleteLn", { link = "DiffDelete" })
		hl(0, "GitSignsDeleteNr", { link = "DiffDelete" })
		hl(0, "GitSignsTopdelete", { link = "DiffDelete" })
		hl(0, "GitSignsTopdeleteLn", { link = "DiffDelete" })
		hl(0, "GitSignsTopdeleteNr", { link = "DiffDelete" })
		hl(0, "GitSignsUntracked", { link = "DiffText" })
		hl(0, "GitSignsUntrackedLn", { link = "DiffText" })
		hl(0, "GitSignsUntrackedNr", { link = "DiffText" })

		-- Configure gitsigns
		require("gitsigns").setup({
			current_line_blame = false, -- Always show blame for the current line if true
			current_line_blame_opts = {
				delay = 0,            -- No delay for displaying blame
				virt_text_pos = "eol", -- Show blame at the end of the line
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		})
	end,
}
