-- Automatically load Lazy.nvim on startup
-- luacheck: globals vim
_G.vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

-- Ensure Lazy.nvim is in the runtime path
vim.opt.runtimepath:prepend(lazypath)

require("core.disabled")
require("core.keymaps")
require("lazy").setup({
	{ import = "themes" },
	{ import = "plugins" },
	{ import = "git" },
})
require("current-theme")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "dbout",
	callback = function()
		vim.wo.foldenable = false
	end,
})

-- vim.opt.number = true        -- Show absolute line number for the current line
vim.opt.relativenumber = true -- Show relative line numbers for other lines
-- require('lazy').setup({ performance = { cache = { enabled = true } } })
vim.opt.foldcolumn = "1"
