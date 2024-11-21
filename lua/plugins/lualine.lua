-- Lualine (Status Line)
return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', "codota/tabnine-nvim" },
	config = function()
		local tabnine = require("tabnine.status")
		require('lualine').setup({
			options = {
				theme = 'OceanicNext',
				section_separators = { '', '' },
				component_separators = { '', '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = {
					'branch',
					{
						function()
							return vim.fn.reg_recording() ~= '' and 'Recording @ ' .. vim.fn.reg_recording() or ''
						end,
						cond = function()
							return vim.fn.reg_recording() ~= ''
						end,
						color = { fg = '#ff9e64', gui = 'bold' },
					},
					'showcmd',
				},
				lualine_c = {
					{
						'filename',
						path = 1
					} -- Use path = 1 for relative path, 2 for absolute path
				},
				lualine_x = {
					'searchcount',
					'encoding',
					'fileformat',
					'filetype',
					function()
						return tabnine.status()
					end,
				},
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
			extensions = { 'neo-tree' },
		})
	end,
}
