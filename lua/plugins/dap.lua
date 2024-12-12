return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			-- Debugger mappings
			vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "Continue Debugging" })
			vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "Step Over" })
			vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "Step Into" })
			vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "Step Out" })
			vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
			vim.keymap.set({ 'n', 'v' }, '<leader>e', function() dapui.eval() end, { desc = "Evaluate Expression" })
			vim.keymap.set('n', '<leader>w', function() require('dapui').elements.watches.add() end, { desc = "Add Watch" })
			vim.keymap.set('n', '<leader>W', function() require('dapui').elements.watches.remove() end,
				{ desc = "Remove Watch" })

			-- Automatically open/close Dap UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			-- Close Dap UI command
			vim.api.nvim_create_user_command("DapCloseUI", function()
				dapui.close()
			end, {})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup()
		end,
	},
}
