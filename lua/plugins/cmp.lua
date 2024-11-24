-- nvim-cmp (Completion)
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"onsails/lspkind-nvim", -- For icons in completion menu
		"williamboman/mason.nvim"
	},
	config = function()
		local cmp = require 'cmp'
		local lspkind = require 'lspkind'

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- Required for snippets
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
				['<C-e>'] = cmp.mapping.complete(),        -- Trigger completion with Ctrl+Space
				-- ['<Tab>'] = cmp.mapping.select_next_item(),    -- Navigate forward
				-- ['<S-Tab>'] = cmp.mapping.select_prev_item(),  -- Navigate backward
			}),
			sources = {
				{ name = 'nvim_lsp' }, -- Language Server Protocol
				{ name = 'buffer' }, -- Buffer words
				{ name = 'path' }, -- File paths
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text", -- Show icons with text
					menu = {
						-- buffer = "[Buffer]",
						-- path = "[Path]",
						-- nvim_lsp = "[LSP]",
					},
				}),
			},
		})

		-- Command-line completion setup
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'cmdline' },
				{ name = 'path' },
			},
		})

		-- Search completion setup
		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' },
			},
		})
	end
}
