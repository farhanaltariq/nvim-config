return {
	'nvim-telescope/telescope.nvim',
	event = 'VeryLazy',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'andrew-george/telescope-themes',
	},
	config = function()
		local telescope = require("telescope")

		-- Configure Telescope to make preview window larger
		telescope.setup {
			defaults = {
				layout_strategy = "horizontal", -- Set default layout strategy to horizontal
				layout_config = {
					horizontal = {
						preview_width = 0.55, -- Adjust preview width only for horizontal layout
					},
					prompt_position = "top", -- Optional: places the prompt at the top
					mirror = false,
				},
				sorting_strategy = "ascending", -- Display result top to bottom
				vimgrep_arguments = {
					'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '-F'
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,              -- Enable fuzzy matching
					override_generic_sorter = true, -- Use fzf as the generic sorter
					override_file_sorter = true, -- Use fzf as the file sorter
					case_mode = "smart_case",  -- "smart_case", Or "ignore_case", "respect_case"
				},
				themes = {
					-- ignore = {},
					enable_previewer = true,
				},
			},
		}
	end
}
