-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before loading lazy.nvim so that mappings are correct.
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "


-- Lazy_cmd for configure lazy.vim, the setting is in "~/.local/share/nvim/lazy/lazy.nvim/lua/view/congfig.lua"
-- TODO: Need to check the lazy.view.config carefully, because there are some conflics between nvim keybinding and the default lazy.nvim keybinding ...
-- TODO: How could we unbind the keys like L in nvim.lazy?
local lazy_cmd = require("lazy.view.config").commands
local lazy_keys = {
	{ cmd = "install", key = "i" },
	{ cmd = "update",  key = "u" },
	{ cmd = "sync",    key = "s" },
	{ cmd = "clean",   key = "cl" },
	{ cmd = "check",   key = "ch" },
	{ cmd = "log",     key = "l" },
	{ cmd = "restore", key = "rs" },
	{ cmd = "profile", key = "p" },
}
-- mapping the default keys in lazy.vim to others by adding <leader>
for _, v in ipairs(lazy_keys) do
	lazy_cmd[v.cmd].key = "<Space>" .. v.key
	-- lazy_cmd[v.cmd].key_plugin = "<leader>" .. v.key
end
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })


-- Setup lazy.nvim
require("lazy").setup({
  -- Color schemes, status line, tab-buffer line
	require("plugins.colorscheme"),
	require("plugins.statusline"),
	require("plugins.tab-bufferline"),
  -- Indent line and folding
	require("plugins.indent"),
  -- require("plugins.fold"),
	-- Scrollbar
	require("plugins.scrollbar"),
	-- colorizer
	require("plugins.colorizer"),

	-- Nvim startup greeting
	require("plugins.startup"),

	-- File navigation manager
	-- require("plugins.yazi"), -- also saifulapm/neotree-file-nesting-config
	require("plugins.nvim-tree"),
	
	-- Searching files and text
	require("plugins.telescope"), -- TODO
	-- treesister

	-- Git
	require("plugins.git"),

	-- Tree-Sitter
	require("plugins.tree-sitter"),

	-- nvim-treesitter for folding
 
  -- Nvim autocompletion
  require("plugins.nvim-cmp"),
	

	-- Markdown-related 
	require("plugins.markdown"), -- markdown-table-mode

	require("plugins.tex"),

	-- Snippets
	-- require("plugins.snippets"), -- UltiSnips
})
