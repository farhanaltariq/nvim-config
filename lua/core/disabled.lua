-- Disable gc and gcc mappings
vim.api.nvim_del_keymap('n', 'gc')
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Nop>", { noremap = true, silent = true })
