return {
	'mrjones2014/legendary.nvim',
	-- since legendary.nvim handles all your keymaps/commands,
	-- its recommended to load legendary.nvim before other plugins
	priority = 10000,
	lazy = false,
	-- sqlite is only needed if you want to use frecency sorting
	-- dependencies = { 'kkharji/sqlite.lua' }
	config = function()
		local legendary = require('legendary')

		legendary.setup({
			keymaps = {
				-- Explorer
				{ '<leader>e',       ':Neotree reveal<CR>',                                                                        description = 'Explorer',             mode = 'n' },

				-- Exit all
				{ '<leader>q',       ':qa<CR>',                                                                                    description = 'Exit Nvim',            mode = 'n' },

				-- Format and Save file
				{ '<leader>f',       function() vim.lsp.buf.format({ async = true }) end,                                          description = 'Format File',          mode = 'n' },
				{ '<leader>s',       ':w<CR>',                                                                                     description = 'Save File',            mode = 'n' },

				-- Redo
				{ '<S-u>',           '<C-r>',                                                                                      description = 'Redo',                 mode = 'n' },

				-- Move around files
				{ '<leader><Tab>',   ':tabnext<CR>',                                                                               description = 'Tab Next',             mode = 'n' },
				{ '<leader><S-Tab>', ':tabprev<CR>',                                                                               description = 'Tab Prev',             mode = 'n' },
				{ '<leader>t',       ':tabnew<CR>',                                                                                description = 'Tab New',              mode = 'n' },
				{ '<leader>w',       ':tabclose<CR>',                                                                              description = 'Tab Close',            mode = 'n' },

				-- Git shortcut
				{ '<leader>g',       '<cmd>Neogit<cr>',                                                                            description = 'Git',                  mode = 'n' },

				-- Select All
				{ '<leader>a',       'ggVG',                                                                                       description = 'Select All',           mode = 'n' },

				-- LSP Shortcuts
				{ '<leader>[',       '<cmd>lua vim.lsp.buf.definition()<CR>',                                                      description = 'Go to definition',     mode = 'n' },
				{ '<leader>]',       '<cmd>lua vim.lsp.buf.implementation()<CR>',                                                  description = 'Go to implementation', mode = 'n' },

				-- Terminal Management
				{ '<F2>',            '<C-\\><C-n>:FloatermHide<CR>',                                                               description = 'Toggle Terminal',      mode = 't' },
				{ '<F2>',            ':FloatermToggle<CR>',                                                                        description = 'Hide Terminal',        mode = 'n' },
				{ '<F2>',            '<ESC>:FloatermToggle<CR>',                                                                   description = 'Hide Terminal',        mode = 'i' },
				{ '<F2>',            '<ESC>:FloatermToggle<CR>',                                                                   description = 'Hide Terminal',        mode = 'x' },
				{ '<F3>',            '<C-\\><C-n>:FloatermNext<CR>',                                                               description = 'Change Terminal',      mode = 't' },
				{ '<F4>',            '<C-\\><C-n>:FloatermNew<CR>',                                                                description = 'New Terminal',         mode = 't' },
				{ '<F4>',            ':FloatermNew<CR>',                                                                           description = 'New Terminal',         mode = 'n' },

				-- Clipboard Manager
				{ '<leader>v',       ':Telescope neoclip<CR>',                                                                     description = 'Clipboard Manager',    mode = 'n' },

				-- Database Manager
				{ '<leader>db',      '<cmd>tabnew | DBUI<cr>',                                                                     description = 'Database Manager',     mode = 'n' },

				-- Telescope Keymaps
				{ '<leader>p',       function() require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end,  description = 'Find Files',           mode = 'n' },
				{ '<leader>F',       function() require('telescope.builtin').live_grep({ hidden = false, no_ignore = false }) end, description = 'Find Everywhere',      mode = 'n' },
				{ '<leader>kt',      function() require('telescope').extensions.themes.themes({}) end,                             description = 'Theme Switcher',       mode = 'n' },

			},
		})
	end
}
