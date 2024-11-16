return {
	  "jacoborus/tender.vim",
	  lazy = false, -- or true if you want to load it on demand
	  priority = 1000, -- Ensure it's loaded early
	  config = function()
	    vim.cmd("colorscheme tender")
			-- Ensure terminal colors are set properly for 256-color support
			vim.opt.termguicolors = false
			vim.api.nvim_set_hl(0, "Keyword", { ctermfg = 2 })
	  end,
	}
