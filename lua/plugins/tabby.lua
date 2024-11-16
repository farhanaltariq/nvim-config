return {
  "nanozuki/tabby.nvim",
  config = function()
		require('tabby').setup()
		vim.opt.showtabline = 2
	end
}
