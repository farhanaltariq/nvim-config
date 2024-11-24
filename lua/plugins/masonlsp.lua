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

			-- Keymap function for convenience
			local on_attach = function(client, bufnr)
				local function buf_set_keymap(mode, lhs, rhs, desc)
					vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
				end

				-- Rename keymap
				buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Refactor')
				buf_set_keymap('v', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Refactor')
			end

			-- Lua LSP setup
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
			})

			-- Go LSP setup with formatting
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						staticcheck = true, -- enables linting and more advanced checks
						analyses = {
							unusedparams = true, -- enable specific linting rules
							shadow = true,
							format = true, -- Make sure format-related checks are enabled
						},
					},
				},
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					-- Enable formatting with gofmt
					if client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function()
								vim.cmd("silent! GoFmt")
							end,
						})
					end

					-- Disable default LSP diagnostics to allow tiny-inline-diagnostic to handle them
					vim.diagnostic.config({
						virtual_text = false, -- Disable inline diagnostic messages
						signs = true,       -- Disable diagnostic signs in the sign column
						underline = true,   -- Disable underlining of errors
						update_in_insert = false, -- Disable updates to diagnostics in insert mode
					})
				end,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
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
	},
}
