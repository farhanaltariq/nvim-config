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
		-- LSP setup
		config = function()
			local lspconfig = require('lspconfig')
			-- Lua LSP setup
			lspconfig.lua_ls.setup({})
			-- Go LSP setup with formatting
			lspconfig.gopls.setup({
				on_attach = function(client, bufnr)
					-- Enable formatting with gofmt
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function()
								vim.cmd("silent! GoFmt")
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			-- Configure gofmt with null-ls
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.gofmt,
				},
			})
		end,
	}
}
