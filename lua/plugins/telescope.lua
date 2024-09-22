-- Suggested dependencies also ripgrep and fd, which could be install by homebrew:
-- brew install ripgrep
-- brew install fd
-- More details could be found either in telescope or ripgrep

return {
	'nvim-telescope/telescope.nvim', 	-- tag = '0.1.8',

	dependencies = { 'nvim-lua/plenary.nvim' },
	-- NOTE: more configurations could be found with :help telescope
	config = function()
		-- Telescope Setups
		local telescope = require('telescope')
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- General Default Settings
				color_devicons = true,
				prompt_prefix = "🔍 ",
				selection_caret = "🐾",  -- " ",
				-- path_display = { "truncate" },
				path_display = { "smart" },
				-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,

	  		-- Windows Settings
				layout_config = {
					horizontal = {
						preview_width = 0.5, -- define preview window half of the total window size
						-- result_width = 0.5, -- define preview window half of the total window size
						preview_cutoff = 30, -- show 30 characters in the preview window
					},
					width = { padding = 8 },  -- setting the telescope window width
					height = {padding = 3}, -- setting the telescope window hight
				},

				-- Mappings Within Telescope for Normal and Insert Mode
				mappings = {
					-- Insert Mode
					i = {
						["<UP>"]   = actions.cycle_history_prev,
						["<DOWN>"] = actions.cycle_history_next,

						["<C-i>"]  = actions.move_selection_previous,
						["<C-k>"]  = actions.move_selection_next,
						["<C-j>"]  = actions.preview_scrolling_up,
						["<C-l>"]  = actions.preview_scrolling_down,

						["C-c"]    = actions.close,
					},
					n = {
						["i"]      = actions.move_selection_previous,
						["k"]      = actions.move_selection_next,
						["j"]      = actions.preview_scrolling_up,
						["l"]      = actions.preview_scrolling_down,

						["gg"]     = actions.move_to_top,
						["G"]      = actions.move_to_bottom,

						["<esc>"]  = actions.close,
						["<PageUp>"]   = actions.results_scrolling_up,
         		["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},
		})

	-- Telescope Key Mappings from Terminal
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, nowait = true, desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, nowait = true, desc = 'Telescope live grep finding strings in open buffers' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, nowait = true, desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, nowait = true, desc = 'Telescope help tags' })

	end,
}


