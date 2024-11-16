-- ~/.config/nvim/lua/tabby_config.lua

return {
  'nanozuki/tabby.nvim',
  config = function()
    require('tabby').setup()
		vim.opt.showtabline = 2  -- Selalu tampilkan tabline
  end
}

