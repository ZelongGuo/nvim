vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_vi = { "v", "i" }
local mode_v = { "v" }
local mode_i = { "i" }

local nmappings = {
	-- Cursor Movement 
	{ from = "j", to = "h", mode = mode_nv},
	{ from = "i", to = "k", mode = mode_nv},
	{ from = "k", to = "j", mode = mode_nv},
	{ from = "h", to = "i", mode = mode_nv},
	{ from = "J", to = "7h", mode = mode_nv},
	{ from = "I", to = "5k", mode = mode_nv},
	{ from = "K", to = "5j", mode = mode_nv},
	{ from = "L", to = "7l", mode = mode_nv},
	{ from = "H", to = "I", mode = mode_nv},
	{ from = "W", to = "5w", mode = mode_nv},
	{ from = "B", to = "5b", mode = mode_nv},
	{ from = "<C-j>", to = "0", mode = mode_nv},
	{ from = "<C-l>", to = "$", mode = mode_nv},   
	{ from = "<C-i>", to = "H", mode = mode_nv},   -- go to top of the screen
	{ from = "<C-k>", to = "L", mode = mode_nv},   -- go to the bottom of the screen
	{ from = "<C-m>", to = "M", mode = mode_nv},   -- go to the middle of the screen

	-- Back to Normal
	{ from = "jk", to = "<Esc>", mode = mode_vi, opts = { noremap = ture}},

	-- " Delte a character, same to 'backspace'
	{ from = "<C-j>", to = "<C-h>", mode = mode_i, opts = { noremap = ture}}, 

	-- 
	{ from = ",f", to = "<Esc>/<++><CR>:nohlsearch<CR>c4l", mode = mode_i, opts = { noremap = ture}}, 
	{ from = "<leader><leader>", to = "<Esc>/<++><CR>:nohlsearch<CR>c4l", mode = mode_n, opts = { noremap = ture}}, 

	-- Saving and quit
	{ from = "s", to = "<nop>", mode = mode_n, opts = { noremap = ture}}, 
	{ from = "S", to = ":w<CR>", mode = mode_n, opts = { noremap = ture}}, 
	{ from = "Q", to = ":q<CR>", mode = mode_n, opts = { noremap = ture}}, 
	
}

vim.keymap.set("n", "q", "<nop>", { noremap = true })
vim.keymap.set("n", ",q", "q", { noremap = true })

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end

-- close win below
vim.keymap.set("n", "<leader>q", function()
	require("trouble").close()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	if #wins > 1 then
		run_vim_shortcut([[<C-w>j:q<CR>]])
	end
end, { noremap = true, silent = true })
