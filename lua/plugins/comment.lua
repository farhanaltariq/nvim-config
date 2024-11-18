return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			mappings = false, -- Disable all default key mappings
			toggler = {
				line = nil,     -- Disable line comment toggle
				block = nil,    -- Disable block comment toggle
			},
			opleader = {
				line = nil,  -- Disable operator-pending line comment toggle
				block = nil, -- Disable operator-pending block comment toggle
			},
		})
	end
}

