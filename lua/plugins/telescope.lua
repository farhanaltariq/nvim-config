-- Telescope
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Keymaps for Telescope and Neo-tree
    local telescope = require("telescope.builtin")
    vim.keymap.set('n', '<leader>p', function()
      telescope.find_files({
        hidden = true,  -- Include hidden files
      })
    end)
    vim.keymap.set('n', '<leader>fg', function()
      telescope.live_grep({
        hidden = true,  -- Include hidden files
      })
    end)
  end
}
