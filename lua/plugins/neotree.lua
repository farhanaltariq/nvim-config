-- Neo-tree
return {
	"nvim-neo-tree/neo-tree.nvim",
	event = 'VeryLazy',
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- NeoTree - file explorer
		vim.wo.wrap = false -- Set wrapper text when expanding neotree
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,     -- Show hidden files
					hide_dotfiles = false, -- Don't hide dotfiles
					hide_gitignored = false, -- Optionally, show git-ignored files too
				},
				window = {
					position = "right", -- You can adjust the position
					width = 40,    -- Set the width of the Neo-tree panel
					mappings = {
						["o"] = "",
					}
				},
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						-- vim.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end
				},
				{
					event = "file_renamed",
					handler = function(args)
						-- fix references to file
						print(args.source, " renamed to ", args.destination)
					end
				},
				{
					event = "file_moved",
					handler = function(args)
						-- fix references to file
						print(args.source, " moved to ", args.destination)
					end
				},
			},
		})

		-- OPEN NEOTREE AT OPENING NVIM
		-- vim.api.nvim_create_augroup("neotree", {})
		-- vim.api.nvim_create_autocmd("UiEnter", {
		-- 	desc = "Open Neotree automatically",
		-- 	group = "neotree",
		-- 	callback = function()
		-- 		if vim.fn.argc() == 0 then
		-- 			vim.cmd "Neotree toggle"
		-- 		end
		-- 	end,
		-- })
	end
}
