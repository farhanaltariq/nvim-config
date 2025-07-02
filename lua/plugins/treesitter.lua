-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	config = function()
		-- Treesitter setup
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "go", "gomod", "lua", "vim", "vimdoc", "query", "javascript", "html", "sql", "rust", "json" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.wo.foldmethod = 'expr'
		vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end
}
