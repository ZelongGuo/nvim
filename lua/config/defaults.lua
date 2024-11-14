vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Latex
vim.g.tex_flavor = "latex"


-- True Color
vim.opt.termguicolors = true
-- vim.env to set the system environment variable (external shell is not needed)
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

--[[
if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
    vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
    vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
end
]]--

-- Disable Compatibility of Old Vim Versions
vim.opt.compatible = false


-- Tab Settings
vim.opt.expandtab = true  -- if expand tab with blank spaces
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true


-- Show Invisible Characters, e.g., tab and space key
-- This setting may affect the indent plugins
vim.opt.list = true
vim.opt.listchars = 'tab:┊\\ ,trail:▫'
--vim.opt.listchars = 'tab:┊\\ ,trail:▫'
--vim.opt.listchars = 'tab:|\\ ,trail:▫'
--vim.opt.listchars = 'tab: \\ ,trail:▫'
vim.opt.formatoptions = vim.o.formatoptions:gsub('tc', '')


-- Customized for Better View
vim.opt.scrolloff = 4
vim.opt.viewoptions = 'cursor,folds,slash,unix'
vim.opt.wrap = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = '100'


-- Code Folding, better with plugin treesitter
vim.opt.foldenable = true
-- vim.opt.foldmethod = "marker"
-- vim.opt.foldmarker = {"<center>", "</center>"}  -- for HTML images
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.indentexpr = ''


-- Vim Windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false   -- disable showing modes


-- Upper and Lower Case and Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Speed Up Editor
vim.opt.ttyfast = true


-- Buffer and Folder Changes Without Saving
vim.opt.hidden = true
vim.opt.autochdir = true
vim.opt.viminfo = "'100,\"0"   -- do not saving marks
-- vim.opt.confirm = true 	       -- ask before exiting modified buffer


-- Highlight and Search
----------------------------------------------------------------------------------
-- Comment this otherwise the utils functions lua cannot work
-- vim.cmd("syntax enable")
----------------------------------------------------------------------------------
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.hlsearch = true
vim.cmd("nohlsearch")
vim.opt.incsearch = true

-- Parentheses Highlight Which Has Been Overwritten By doom-one
vim.opt.matchpairs:append("<:>")      -- add <> also to be matched
-- vim.opt.showmatch = true
-- vim.opt.matchtime = 5

-- Spell
-- vim.opt.spell = true
-- vim.opt.spelllang = "en"
-- vim.opt.spellfile = "~/.config/nvim/"  -- set dict file
-- vim.opt.spellcapcheck =  -- set capital check mode

-- Disable Mouse
vim.opt.mouse = ""

-- Line nr
vim.opt.number = true
vim.opt.relativenumber = true


-- Disable Timeout Waiting
vim.opt.timeout = false
vim.opt.timeoutlen = 0
vim.opt.ttimeoutlen = 0
-- cursor hold time, speed up the plugins
vim.opt.updatetime = 100


-- Show Command in Right-bottom Corner
vim.opt.showcmd = true


-- Command Completion Menu
vim.opt.wildmenu = true


-- Others
vim.opt.visualbell = true


