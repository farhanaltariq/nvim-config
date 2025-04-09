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
		local hop = require('hop')

		legendary.setup({
			keymaps = {
				-- Explorer
				{ '<leader>e',       ':Neotree reveal<CR>',                               description = 'Explorer',         mode = 'n' },

				-- Exit all
				{ '<leader>q',       ':qa<CR>',                                           description = 'Exit Nvim',        mode = 'n' },

				-- Format and Save file
				{ '<leader>f',       function() vim.lsp.buf.format({ async = true }) end, description = 'Format File',      mode = 'n' },
				{ '<leader>s',       ':w<CR>',                                            description = 'Save File',        mode = 'n' },

				-- Redo
				{ '<S-u>',           '<C-r>',                                             description = 'Redo',             mode = 'n' },

				-- Move around files
				{ '<leader><Tab>',   ':tabnext<CR>',                                      description = 'Tab Next',         mode = 'n' },
				{ '<leader><S-Tab>', ':tabprev<CR>',                                      description = 'Tab Prev',         mode = 'n' },
				{ '<leader>t',       ':tabnew<CR>',                                       description = 'Tab New',          mode = 'n' },
				{ '<leader>w',       ':tabclose<CR>',                                     description = 'Tab Close',        mode = 'n' },

				-- Git shortcut
				{ '<leader>g',       '<cmd>Neogit<cr>',                                   description = 'Git',              mode = 'n' },

				-- Select All
				{ '<leader>a',       'ggVG',                                              description = 'Select All',       mode = 'n' },

				-- LSP Shortcuts
				{ '<leader>[',       '<cmd>lua vim.lsp.buf.definition()<CR>',             description = 'Go to definition', mode = 'n' },
				{
					'<leader>]',
					function()
						require('telescope.builtin').lsp_implementations {}
					end,
					description = 'Go to implementation',
					mode = { 'n', 'v' }
				},
				{ '<leader>r',  '<cmd>lua vim.lsp.buf.rename()<CR>',                                                          description = 'Refactor',                                     mode = { 'n', 'v' } },

				-- Terminal Management
				{ '<F2>',       '<C-\\><C-n>:FloatermHide<CR>',                                                               description = 'Toggle Terminal',                              mode = 't' },
				{ '<F2>',       ':FloatermToggle<CR>',                                                                        description = 'Hide Terminal',                                mode = 'n' },
				{ '<F2>',       '<ESC>:FloatermToggle<CR>',                                                                   description = 'Hide Terminal',                                mode = 'i' },
				{ '<F2>',       '<ESC>:FloatermToggle<CR>',                                                                   description = 'Hide Terminal',                                mode = 'x' },
				{ '<F3>',       '<C-\\><C-n>:FloatermNext<CR>',                                                               description = 'Change Terminal',                              mode = 't' },
				{ '<F4>',       '<C-\\><C-n>:FloatermNew<CR>',                                                                description = 'New Terminal',                                 mode = 't' },
				{ '<F4>',       ':FloatermNew<CR>',                                                                           description = 'New Terminal',                                 mode = 'n' },

				-- Clipboard Manager
				{ '<leader>v',  ':Telescope neoclip<CR>',                                                                     description = 'Clipboard Manager',                            mode = { 'n', 'v' } },

				{ '<leader>p',  function() require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end,  description = 'Find Files',                                   mode = 'n' },
				{ '<leader>F',  function() require('telescope.builtin').live_grep({ hidden = false, no_ignore = false }) end, description = 'Find Everywhere',                              mode = 'n' },
				{ '<leader>kt', function() require('telescope').extensions.themes.themes({}) end,                             description = 'Theme Switcher',                               mode = 'n' },

				-- Open Legendary Keymaps
				{ '<leader>P',  '<cmd>Legendary<CR>',                                                                         description = 'Open Legendary Keymaps',                       mode = { 'n', 'v' } },

				-- Trouble Keymaps
				{ '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>',                                                        description = 'Diagnostics (Trouble)',                        mode = 'n' },
				{ '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',                                           description = 'Buffer Diagnostics (Trouble)',                 mode = 'n' },
				{ '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>',                                                description = 'Symbols (Trouble)',                            mode = 'n' },
				{ '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',                                 description = 'LSP Definitions / references / ... (Trouble)', mode = 'n' },
				{ '<leader>xL', '<cmd>Trouble loclist toggle<cr>',                                                            description = 'Location List (Trouble)',                      mode = 'n' },
				{ '<leader>xQ', '<cmd>Trouble qflist toggle<cr>',                                                             description = 'Quickfix List (Trouble)',                      mode = 'n' },

				-- DAP Keymaps
				{ '<F5>',       function() require('dap').continue() end,                                                     description = "Continue Debugging",                           mode = 'n' },
				{ '<F10>',      function() require('dap').step_over() end,                                                    description = "Step Over",                                    mode = 'n' },
				{ '<F11>',      function() require('dap').step_into() end,                                                    description = "Step Into",                                    mode = 'n' },
				{ '<F12>',      function() require('dap').step_out() end,                                                     description = "Step Out",                                     mode = 'n' },
				{ '<M-b>',      function() require('dap').toggle_breakpoint() end,                                            description = "Toggle Breakpoint",                            mode = 'n' },
				{ '<M-e>',      function() require('dapui').eval() end,                                                       description = "Evaluate Expression",                          mode = { 'n', 'v' } },
				{ '<M-w>',      function() require('dapui').elements.watches.add() end,                                       description = "Add Watch",                                    mode = 'n' },
				{ '<M-W>',      function() require('dapui').elements.watches.remove() end,                                    description = "Remove Watch",                                 mode = 'n' },

				-- Hop Keymaps
				{ 'f',          function() hop.hint_words() end,                                                              description = "Hop: Hint char",                               mode = '' },
				{ 'F',          function() hop.hint_words() end,                                                              description = "Hop: Hint char",                               mode = '' },
			},
			commands = {
				{
					itemgroup = "DAP",
					description = "Debug Adapter Protocol commands",
					commands = {
						{
							":DapCloseUI",
							function()
								require("dapui").close()
							end,
							description = "Close Dap UI",
						},
					},
				},
			},
		})
	end
}
