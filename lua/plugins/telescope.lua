return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local telescope = require("telescope.builtin")
		local wk = require("which-key")
		require('telescope').load_extension('fzf')
		-- Register keymaps for Telescope
		wk.add({
			{ '<leader>p', function() telescope.find_files({ hidden = true, no_ignore = true }) end,  group = 'Find Files' },
			{ '<leader>F', function() telescope.live_grep({ hidden = false, no_ignore = false }) end, group = 'Find Everywhere' },
		})

		-- Configure Telescope to make preview window larger
		require('telescope').setup {
			defaults = {
				layout_config = {
					preview_width = 0.55, -- Adjust this value for the preview window size (larger than the search list)
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
					case_mode = "smart_case",  -- Or "ignore_case", "respect_case"
				},
			},
		}
	end
}
