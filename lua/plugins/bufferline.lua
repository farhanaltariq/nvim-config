return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup {
      options = {
        separator_style = "thin",     -- Choose "slant", "thick", "thin", etc.
        diagnostics = "nvim_lsp",      -- Enable LSP diagnostics
      },
      highlights = {
        -- Background for inactive buffers
        background = {
         -- fg = "#6c6f93",              -- Inactive text color (grayish)
         -- bg = "#282c34",              -- Inactive background color (dark gray)
        },
        -- Highlight for the buffer currently selected
        buffer_selected = {
         -- fg = "#ffffff",              -- Active text color (white)
         -- bg = "#44475a",              -- Active background color (darker shade)
          bold = true,                 -- Make the active buffer bold
        },
        -- Fill color (the empty space in the bar)
        fill = {
          bg = "#1c1f24",              -- Background color of the entire bar (dark)
        },
        -- Modified buffers (unsaved changes indicator)
        modified = {
          fg = "#e5c07b",              -- Yellow color for unsaved changes
        },
        modified_selected = {
          fg = "#e5c07b",              -- Yellow color for active unsaved changes
          bold = true,
        },
        -- Diagnostic colors (errors and warnings)
        error = {
          fg = "#e06c75",              -- Red color for errors
        },
        warning = {
          fg = "#e5c07b",              -- Yellow color for warnings
        },
        info = {
          fg = "#61afef",              -- Blue color for info
        },
      }
    }
  end
}

