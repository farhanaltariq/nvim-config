-- nvim-cmp (Completion)
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    -- nvim-cmp setup
    local cmp = require'cmp'
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
      }
    })

    -- Command-line completion setup
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' },
        { name = 'path' }
      }
    })

    -- Search completion setup
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
  end
}
