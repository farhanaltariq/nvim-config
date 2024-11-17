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
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', {})

-- Exit all
vim.keymap.set('n', '<leader>q', ':qa<CR>', {})

-- Save file
vim.keymap.set('n', '<leader>s', ':w<CR>', {})

-- Redo - u for undo
vim.keymap.set('n', '<S-u>', '<C-r>', {})

-- Move around files
vim.keymap.set('n', '<leader><Tab>', ':tabnext<CR>', {})
vim.keymap.set('n', '<leader><S-Tab>', ':tabprev<CR>', {})
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', {})
vim.keymap.set('n', '<leader>w', ':tabclose<CR>', {})

-- Comment a line
vim.keymap.set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end, {})
-- Visual mode: Toggle comment on selected lines
vim.keymap.set('v', '<leader>/', "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {})

-- Git shortcut
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<cr>', {})

-- SelectAll
vim.keymap.set('n', '<leader>a', 'ggVG', {})

-- Mapping for LSP go to definition and go to implementation
vim.api.nvim_set_keymap('n', '<leader>[', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>]', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })

-- Shortcut untuk minimize (hide) dari dalam Floaterm
vim.keymap.set("t", "<F12>", "<C-\\><C-n>:FloatermHide<CR>", { desc = "Toggle Floaterm", silent = true })
vim.keymap.set("n", "<F12>", ":FloatermToggle<CR>", { desc = "Hide Floaterm", silent = true })
vim.keymap.set("i", "<F12>", "<ESC>:FloatermToggle<CR>", { desc = "Hide Floaterm", silent = true })
vim.keymap.set("x", "<F12>", "<ESC>:FloatermToggle<CR>", { desc = "Hide Floaterm", silent = true })
