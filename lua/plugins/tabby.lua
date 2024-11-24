return {
  "nanozuki/tabby.nvim",
	event = 'VeryLazy',
  config = function()
		require('tabby').setup()
		vim.opt.showtabline = 2
	end
}
