-- Automatically load Lazy.nvim on startup
-- luacheck: globals vim
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
vim.opt.rtp:prepend(lazypath)

require("core.disabled")
require("core.keymaps")
require("lazy").setup({
	{ import = "plugins" },
	{ import = "git" },
	{ import = "themes" },
})
