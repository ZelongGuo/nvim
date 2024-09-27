return {

	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	-- event = "VeryLazy",

	config = function()
		local nvimtree = require("nvim-tree")
		-- recommended settings from nvim-tree documentation, disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
  	-- optionally enable 24-bit colour
  	vim.opt.termguicolors = true

		-- ------------------------------------------------------------------------------
  	-- local function my_on_attach(bufnr)
		-- 	local api = require("nvim-tree.api")
		-- 	local function opts(desc)
		-- 		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		-- 	 end

		-- 	-- default mappings
		-- 	api.config.mappings.default_on_attach(bufnr)
		-- 	
		-- 	-- custom mappings
  	--   -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  	--   -- vim.keymap.set('n', '?',     api.tree.toggle_help,          opts('Help'))
  	--   vim.keymap.set('n', 'zh', api.tree.toggle_hidden_filter,  opts('Toggle Filter: Dotfiles'))
  	--   vim.keymap.set('n', 'q',  api.tree.close, opts('Close'))
  	-- end
		------------------------------------------------------------------------------
		
		nvimtree.setup({
			view = { width = 38, relativenumber = true, side = "left", },
			-- change folder arrow icons
			renderer = {
				indent_markers = { enable = true, },
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- "", -- arrow when folder is closed
							arrow_open = "", --"", -- arrow when folder is open
						},
					},
				},
			},

			-- disable window_picker for explorer to work well with window splits
			actions = { open_file = { window_picker = { enable = false, }, }, },

			filters = { custom = { ".DS_Store" }, },
			git = { ignore = false, },

			-- pass my key mappings to setup
			-- on_attach = my_on_attach,
		})

		-- Setting key mappings
		local api = require('nvim-tree.api')
		local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
  	vim.keymap.set('n', 'tt', api.tree.toggle,  opts('Open or Close the Tree'))
  	vim.keymap.set('n', 'zh', api.tree.toggle_hidden_filter,  opts('Toggle Filter: Dotfiles'))
  	vim.keymap.set('n', 'q',  api.tree.close, opts('Close'))

		--  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open the file or folder'))
		-- 	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
		
		end,

}
