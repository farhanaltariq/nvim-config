return {
	"mg979/vim-visual-multi",
	event = 'VeryLazy',
	init = function()
		vim.g.VM_default_mappings = 0 -- Disable ALL defaults
		vim.g.VM_maps = {
			['Find Under'] = '<C-d>',   -- Essential starter
			['Find Subword Under'] = '<C-d>',
			['Add Cursor Down'] = '<C-j>', -- Using Alt instead of Ctrl
			['Add Cursor Up'] = '<C-k>',
		}
	end
}
