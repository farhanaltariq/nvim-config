local M = {}

function M.enable()
	local lspconfig = require("lspconfig")

	lspconfig.rust_analyzer.setup({
		on_attach = function(_, _)
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
			})
		end,
	})

	-- You can optionally add rustfmt via null-ls like this:
	-- local null_ls = require("null-ls")
	-- null_ls.register(null_ls.builtins.formatting.rustfmt)
end

function M.disable()
	-- Stop the LSP client for rust
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		if client.name == "rust_analyzer" then
			client.stop()
		end
	end

	-- Reset any null-ls sources (if used)
	require("null-ls.sources").reset()
end

return M
