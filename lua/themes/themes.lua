-- List of available themes to install and use
local themes = {
  tender = {
    name = "tender",
    plugin = "jacoborus/tender.vim",
  },
  tokyonight = {
    name = "tokyonight",
    plugin = "folke/tokyonight.nvim",
  },
  gruvbox = {
    name = "gruvbox",
    plugin = "morhetz/gruvbox",
  },
}

-- Change this value to select your preferred theme
local selected_theme = "tokyonight" -- Choose between "tender", "tokyonight", "gruvbox"

-- Helper function to setup plugin configurations for lazy.nvim
local function setup_plugins()
  local plugins = {}
  for key, theme in pairs(themes) do
    table.insert(plugins, {
      theme.plugin,
      lazy = false, -- Load themes on startup
      priority = 1000,
      config = function()
        if key == selected_theme then
          vim.opt.termguicolors = true -- Enable true color support
          vim.cmd("colorscheme " .. theme.name) -- Apply the selected theme
        end
      end,
    })
  end
  return plugins
end

-- Return the plugins configuration for lazy.nvim
return setup_plugins()

