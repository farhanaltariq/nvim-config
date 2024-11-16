-- Mason and LSP Config
return {
  {
    "williamboman/mason.nvim",
    config = function()
      -- Mason setup
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"gopls", "pbls", "rust_analyzer"},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    -- LSP setup
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
    end
  }
}
