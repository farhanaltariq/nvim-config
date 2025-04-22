local M = {}

function M.enable()
	local lspconfig = require("lspconfig")

	-- Keymap function for convenience
	local on_attach = function(_, _)
		vim.api.nvim_create_autocmd("BufWritePre", {
			-- buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end

	-- Lua LSP setup
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
	})

	lspconfig.gopls.setup({
		settings = {
			gopls = {
				staticcheck = true, -- enables linting and more advanced checks
				analyses = {
					unusedparams = true, -- enable specific linting rules
					shadow = true,
					format = true,  -- Make sure format-related checks are enabled
				},
				gofumpt = true,   -- Use gofumpt for stricter formatting
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					constantValues = true,
					parameterNames = true,
				},
			},
		},
		on_attach = function(_, _)
			-- Disable default LSP diagnostics to allow tiny-inline-diagnostic to handle them
			vim.diagnostic.config({
				virtual_text = false, -- Disable inline diagnostic messages
				signs = true,         -- Disable diagnostic signs in the sign column
				underline = true,     -- Disable underlining of errors
				update_in_insert = false, -- Disable updates to diagnostics in insert mode
			})
		end,
	})

	local null_ls = require("null-ls")
	-- Configure gofmt with null-ls
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.gofmt,
		},
	})
end

function M.disable()
	local clients = vim.lsp.get_clients()
	for _, client in ipairs(clients) do
		if client.name == "gopls" then
			client.stop()
		end
	end

	require("null-ls.sources").reset()
end

return M
