return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,     -- Enable the cmdline UI
                view = "cmdline_popup", -- Use the floating UI for command input
                format = {
                    cmdline = { pattern = "^:", icon = "[cmd]", lang = "vim" },
                },
            },
            popupmenu = {
                enabled = true, -- Enable a custom floating popup menu for completions
            },
            messages = {
                enabled = true,
            },
            presets = {
                long_message_to_split = true, -- Display long messages in a split
                inc_rename = true,        -- Better input UI for incremental renaming
                lsp_doc_border = true,    -- Add borders to LSP documentation windows
            },
            views = {
                -- Configuration for notifications at the bottom right corner
                notify = {
                    position = {
                        row = "95%",      -- 95% down from the top (bottom edge)
                        col = "98%",      -- 98% to the right (near the right edge)
                        anchor = "SE",    -- South-East anchor (bottom-right corner)
                    },
                    size = {
                        width = 40,       -- Fixed width for notifications
                        height = "auto",  -- Auto height based on content
                    },
                },
            },
        })

        -- Additional configuration for `nvim-notify` to ensure it works well with Noice
        require("notify").setup({
            stages = "fade_in_slide_out",
            timeout = 1500,            -- Timeout for notification messages
            render = "minimal",
            top_down = false,          -- Show notifications from bottom up
        })
    end
}

