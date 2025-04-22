-- Mason and LSP Config
return {
	{
		"williamboman/mason.nvim",
		config = function()
			-- Mason setup
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "pbls", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Command to switch languages
			vim.api.nvim_create_user_command("UseLang", function(opts)
				require("langs.lang_switcher").switch(opts.args)
			end, {
				nargs = 1,
				complete = function()
					return require("langs.lang_switcher").list()
				end,
			})

			-- Command to list available languages
			vim.api.nvim_create_user_command("ListLangs", function()
				local langs = require("langs.lang_switcher").list()
				print("Available languages:")
				for _, lang in ipairs(langs) do
					print(" - " .. lang)
				end
			end, {})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			-- Configure gofmt with null-ls
			null_ls.setup()
		end,
	},
}
