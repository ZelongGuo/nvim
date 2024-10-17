-- Variables Settings
local mode_nv = { "n", "v" }
local mode_vi = { "v", "i" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_n = { "n" }


local nmappings = {
	-- Cursor Movement 
	{ mode = mode_nv,           from = "j", to = "h" },
	{ mode = mode_nv,           from = "i", to = "k" },
	{ mode = mode_nv,           from = "k", to = "j" },
	{ mode = mode_nv,           from = "h", to = "i" },
	{ mode = mode_nv,           from = "J", to = "7h" },
	{ mode = mode_nv,           from = "I", to = "5k" },
	{ mode = mode_nv,           from = "K", to = "5j" },
	{ mode = mode_nv,           from = "L", to = "7l" },
	{ mode = mode_nv,           from = "H", to = "I" },
	{ mode = mode_nv,           from = "W", to = "5w" },
	{ mode = mode_nv,           from = "B", to = "5b" },
	{ mode = { "n", "v", "o" }, from = "<c-j>", to = "0" }, -- "o" is important for gU ctrl j
	{ mode = { "n", "v", "o" }, from = "<c-l>", to = "$" },
	{ mode = mode_nv,           from = "<c-i>", to = "H" }, -- go to top of the screen
	{ mode = mode_nv,           from = "<c-k>", to = "L" }, -- go to the bottom of the screen
	{ mode = mode_nv,           from = "<c-m>", to = "M" }, -- go to the middle of the screen

	-- Back to Normal
	{ mode = mode_vi, from = "jk", to = "<Esc>" },

	-- Highlight
	{ mode = mode_n, from = "<leader><CR>", to = ":nohlsearch<CR>", opts = { silent = true }},

	-- Windows (buffers) and Split
	{ mode = mode_n, from = "sn",        to = ":vnew<CR>", },

	{ mode = mode_n, from = "s",         to = "<nop>", },
	{ mode = mode_n, from = "si",        to = ":leftabove split enew<CR>", },
	{ mode = mode_n, from = "sk",        to = ":rightbelow split enew<CR>", },
	{ mode = mode_n, from = "sj",        to = ":leftabove vsplit enew<CR>", },
	{ mode = mode_n, from = "sl",        to = ":rightbelow vsplit enew<CR>", },
	{ mode = mode_n, from = "sI",        to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
	{ mode = mode_n, from = "sK",        to = ":set splitbelow<CR>:split<CR>", },
	{ mode = mode_n, from = "sJ",        to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
	{ mode = mode_n, from = "sL",        to = ":set splitright<CR>:vsplit<CR>", },
	{ mode = mode_n, from = "<leader>i", to = "<C-w>k", },
	{ mode = mode_n, from = "<leader>k", to = "<C-w>j", },
	{ mode = mode_n, from = "<leader>j", to = "<C-w>h", },
	{ mode = mode_n, from = "<leader>l", to = "<C-w>l", },
		-- switch the windows places,<C-w>r rotates the windows which could greater than 2 buffers
	{ mode = mode_n, from = "sml",        to = "<C-w>r", },  -- Note: <C-W>x switch the window with next buffer, only works for 2 buffers
	{ mode = mode_n, from = "smj",        to = "<C-w>r", },  -- Note: <C-W>x switch the window with next buffer, only works for 2 buffers
	{ mode = mode_n, from = "smi",        to = "<C-w>r", },  -- Note: <C-W>x switch the window with next buffer, only works for 2 buffers
	{ mode = mode_n, from = "smk",        to = "<C-w>r", },  -- Note: <C-W>x switch the window with next buffer, only works for 2 buffers

	{ mode = mode_n, from = "<up>",      to = ":res +5<CR>", },
	{ mode = mode_n, from = "<down>",    to = ":res -5<CR>", },
	{ mode = mode_n, from = "<left>",    to = ":vertical resize-5<CR>", },
	{ mode = mode_n, from = "<right>",   to = ":vertical resize+5<CR>", },

	-- Tab Management
	{ mode = mode_n, from = "tn", to = ":tabe<CR>", },     -- new tab
	{ mode = mode_n, from = "tN", to = ":tab split<CR>", },     -- open current buffer at a new tab
	{ mode = mode_n, from = "tl", to = "gt", },            -- or <C-w>gt, change into right tab, ":+tabnext<CR>"
	{ mode = mode_n, from = "tj", to = "gT", },            -- or <C-w>gT, change into left tab, ":-tabnext<CR>"
	{ mode = mode_n, from = "tml", to = ":+tabmove<CR>", },  -- move the tab page to the right
	{ mode = mode_n, from = "tmj", to = ":-tabmove<CR>", },  -- move the tab page to the left
	
	-- Placeholder <++>
	{ mode = mode_n, from = "<leader><leader>", to = "<Esc>/<++><CR>:nohlsearch<CR>c4l" },
	{ mode = mode_i, from = ",f", to = "<Esc>/<++><CR>:nohlsearch<CR>c4l" },

	-- Saving and Quit
	{ mode = mode_n, from = "s", to = "<nop>" },
	{ mode = mode_n, from = "S", to = ":w<CR>" },
	{ mode = mode_n, from = "Q", to = ":q<CR>" },
	
	-- Delete a Character in Insert mode
	{ mode = mode_i, from = "<C-j>", to = "<C-h>" },  -- Same to 'backspace'
	{ mode = mode_i, from = "<C-l>", to = "<Del>" },  -- Same to 'backspace'


	-- Source the current file
	-- source %

}

-- vim.keymap.set("n", "q", "<nop>", { noremap = true })
-- vim.keymap.set("n", ",q", "q", { noremap = true })

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode, mapping.from, mapping.to, { noremap = true })
end

--[[

local function run_vim_shortcut(shortcut)
	local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
	vim.api.nvim_feedkeys(escaped_shortcut, 'n', true)
end

-- ]]

-- --close windowns below
-- vim.keymap.set("n", "<leader>q", function()
-- 	require("trouble").close()
-- 	local wins = vim.api.nvim_tabpage_list_wins(0)
-- 	if #wins > 1 then
-- 		run_vim_shortcut([[<C-w>j:q<CR>]])
-- 	end
-- end, { noremap = true, silent = true }) 

