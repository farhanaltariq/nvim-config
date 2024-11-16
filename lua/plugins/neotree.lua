-- Neo-tree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    -- NeoTree - file explorer
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,  -- Show hidden files
          hide_dotfiles = false,  -- Don't hide dotfiles
          hide_gitignored = false,  -- Optionally, show git-ignored files too
        },
        window = {
          position = "right",  -- You can adjust the position
          width = 50,  -- Set the width of the Neo-tree panel
        },
      },
    })
    end
}
