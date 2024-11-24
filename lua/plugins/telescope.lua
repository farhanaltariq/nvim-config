return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'andrew-george/telescope-themes',
	},
	config = function()
		local telescope = require("telescope")
		local telescopeBuiltin = require("telescope.builtin")
		local wk = require("which-key")
		telescope.load_extension('fzf')
		telescope.load_extension('themes')
		-- Register keymaps for Telescope
		wk.add({
			{ '<leader>p', function() telescopeBuiltin.find_files({ hidden = true, no_ignore = true }) end,  group = 'Find Files' },
			{ '<leader>F', function() telescopeBuiltin.live_grep({ hidden = false, no_ignore = false }) end, group = 'Find Everywhere' },
			{ "<leader>kt", ":Telescope themes<CR>", {noremap = true, silent = true, desc = "Theme Switcher"} },
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
					case_mode = "smart_case",  -- "smart_case", Or "ignore_case", "respect_case"
				},
			},
		}
	end
}
