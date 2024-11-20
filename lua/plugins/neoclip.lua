return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      { "kkharji/sqlite.lua", lazy = true }, -- Optional for persistent history
    },
    config = function()
      require("neoclip").setup({
        history = 1000,
        enable_persistent_history = true,
        db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
        default_register = { '"', "+", "*" },
        keys = {
          telescope = {
            i = {
              select = "<cr>",
              paste = "<cr>", -- Automatically pastes on select
              paste_behind = "<c-k>",
            },
            n = {
              select = "<cr>",
              paste = "p", -- Automatically pastes on select
              paste_behind = "P",
            },
          },
        },
      })
      require("telescope").load_extension("neoclip")
    end,
  },
}

