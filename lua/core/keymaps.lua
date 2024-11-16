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

-- Comment a line
vim.keymap.set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end, {})
-- Visual mode: Toggle comment on selected lines
vim.keymap.set('v', '<leader>/', "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {})

-- Git shortcut
vim.keymap.set('n', '<leader>F', '<cmd>Fugit2<cr>', {})

-- SelectAll
vim.keymap.set('n', '<leader>a', 'ggVG', {})

