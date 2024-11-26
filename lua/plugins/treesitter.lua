-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPre",
	config = function()
		-- Treesitter setup
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "go", "gomod", "lua", "vim", "vimdoc", "query", "javascript", "html", "sql" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.wo.foldmethod = 'expr'
		vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
		-- Disable automatic folding when opening the buffer
		vim.cmd('setlocal foldlevel=99') -- This will make sure folds are not collapsed on open
	end
}
