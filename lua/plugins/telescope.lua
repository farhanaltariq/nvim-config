return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope.builtin")
    local wk = require("which-key")

    -- Register keymaps for Telescope
    wk.add({
      { '<leader>p', function() telescope.find_files({ hidden = true, no_ignore = true }) end, group = 'Find Files' },
      { '<leader>F', function() telescope.live_grep({ hidden = false, no_ignore = false }) end, group = 'Find Everywhere' }
    })
  end
}

