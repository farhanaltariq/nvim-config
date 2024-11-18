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
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', { desc = "Explorer" })

-- Exit all
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = "Exit Nvim" })

-- Format and Save file
vim.keymap.set('n', '<leader>f', function()
	vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format File" })

vim.keymap.set('n', '<leader>s', ':w<CR>', { desc = "Save File" })

-- Redo - u for undo
vim.keymap.set('n', '<S-u>', '<C-r>', { desc = "Redo" })

-- Move around files
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>', { desc = "Tab Next" })
vim.keymap.set('n', '<leader><S-Tab>', ':tabprev<CR>', { desc = "Tab Prev" })
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { desc = "Tab New" })
vim.keymap.set('n', '<leader>w', ':tabclose<CR>', { desc = "Tab Close" })

-- Comment a line
vim.keymap.set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end,
	{ desc = "Comment line" })
-- Visual mode: Toggle comment on selected lines
vim.keymap.set('v', '<leader>/', "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Comment line" })

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
vim.keymap.set("t", "<F10>", "<C-\\><C-n>:FloatermHide<CR>", { desc = "Toggle Terminal", silent = true })
vim.keymap.set("n", "<F10>", ":FloatermToggle<CR>", { desc = "Hide Terminal", silent = true })
vim.keymap.set("i", "<F10>", "<ESC>:FloatermToggle<CR>", { desc = "Hide Terminal", silent = true })
vim.keymap.set("x", "<F10>", "<ESC>:FloatermToggle<CR>", { desc = "Hide Terminal", silent = true })

vim.keymap.set("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", { desc = "Change Terminal", silent = true })
