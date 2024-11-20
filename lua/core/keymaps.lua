-- luacheck: globals vim
-- luacheck: globals prepend
_G.vim = vim
vim.opt.termguicolors = true

-- Set tab-related options
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true

-- Set leader key
vim.g.mapleader = "\\"

-- Neotree Toggle
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', { desc = "Explorer", silent = true })

-- Exit all
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = "Exit Nvim", silent = true })

-- Format and Save file
vim.keymap.set('n', '<leader>f', function()
	vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format File" })

vim.keymap.set('n', '<leader>s', ':w<CR>', { desc = "Save File", silent = true })

-- Redo - u for undo
vim.keymap.set('n', '<S-u>', '<C-r>', { desc = "Redo" })

-- Move around files
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>', { silent = true, desc = "Tab Next" })
vim.keymap.set('n', '<leader><S-Tab>', ':tabprev<CR>', { silent = true, desc = "Tab Prev" })
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { silent = true, desc = "Tab New" })
vim.keymap.set('n', '<leader>w', ':tabclose<CR>', { silent = true, desc = "Tab Close" })

-- Git shortcut
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<cr>', { desc = "Git" })

-- SelectAll
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = "Select All" })

-- Mapping for LSP go to definition and go to implementation
vim.api.nvim_set_keymap('n', '<leader>[', '<cmd>lua vim.lsp.buf.definition()<CR>',
	{ noremap = true, silent = true, desc = "Go to definition" })
vim.api.nvim_set_keymap('n', '<leader>]', '<cmd>lua vim.lsp.buf.implementation()<CR>',
	{ noremap = true, silent = true, desc = "Go to implementation" })

-- Shortcut untuk minimize (hide) dari dala Terminalm
vim.keymap.set("t", "<F2>", "<C-\\><C-n>:FloatermHide<CR>", { desc = "Toggle Terminal", silent = true })
vim.keymap.set("n", "<F2>", ":FloatermToggle<CR>", { desc = "Hide Terminal", silent = true })
vim.keymap.set("i", "<F2>", "<ESC>:FloatermToggle<CR>", { desc = "Hide Terminal", silent = true })
vim.keymap.set("x", "<F2>", "<ESC>:FloatermToggle<CR>", { desc = "Hide Terminal", silent = true })

vim.keymap.set("t", "<F3>", "<C-\\><C-n>:FloatermNext<CR>", { desc = "Change Terminal", silent = true })

vim.keymap.set("t", "<F4>", "<C-\\><C-n>:FloatermNew<CR>", { desc = "New Terminal", silent = true })
vim.keymap.set("n", "<F4>", ":FloatermNew<CR>", { desc = "New Terminal", silent = true })
local keymaps = {
	{ "<leader>v", ":Telescope neoclip<CR>", desc = "Clipboard Manager", group = "Telescope" },
}

for _, map in ipairs(keymaps) do
	vim.keymap.set("n", map[1], map[2], { desc = map.desc })
end

vim.keymap.set('n', '<leader>db', '<cmd>DBUI<cr>', { desc = "Database Manager" })
