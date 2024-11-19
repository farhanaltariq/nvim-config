-- Neo-tree
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- NeoTree - file explorer
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,          -- Show hidden files
					hide_dotfiles = false,   -- Don't hide dotfiles
					hide_gitignored = false, -- Optionally, show git-ignored files too
				},
				window = {
					position = "right", -- You can adjust the position
					width = 40,         -- Set the width of the Neo-tree panel
					mappings = {
						["o"] = "",
					}
				},
			},
		})

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
  -- opts = {
  --   filesystem = {
  --     commands = {
  --       -- If item is a file it will close neotree after opening it.
  --       open_and_close_neotree = function(state)
  --         require("neo-tree.sources.filesystem.commands").open(state)
  --
  --         local tree = state.tree
  --         local success, node = pcall(tree.get_node, tree)
  --
  --         if not success then
  --           return
  --         end
  --
  --         if node.type == "file" then
  --           require("neo-tree.command").execute({ action = "close" })
  --         end
  --       end,
  --     },
  --     window = {
  --       mappings = {
  --         ["<CR>"] = "open_and_close_neotree",
  --         ["<S-CR>"] = "open",
  --       },
  --     },
  --   },
  -- },
