-- True color
vim.opt.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

--[[
if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
    vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
    vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
end
--]]

-- vim.opt.exrc = true
vim.opt.secure = false


-- Tab settings
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = 'tab:┊\\ ,trail:▫'

vim.o.scrolloff = 4
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.indentexpr = ''
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldlevelstart = 99

vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.visualbell = true
vim.o.colorcolumn = '100'


-- Speed up editor
vim.opt.ttyfast = true

-- Buffer and folder changes without saving
vim.opt.hidden = true
vim.opt.autochdir = true

-- Highlight and search
vim.cmd("syntax enable")
vim.cmd("syntax on")
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.hlsearch = true
vim.cmd("nohlsearch")
vim.opt.incsearch = true

-- Spell
vim.opt.spell = true

-- Disable mouse
vim.opt.mouse = ""

-- Line Nr
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable timeout waiting 
vim.opt.timeout = false
vim.opt.timeoutlen = 0
vim.opt.ttimeoutlen = 0
-- Cursor hold time, speed up the plugins  
vim.opt.updatetime = 100

-- Show command in right-bottom corner
vim.opt.showcmd = true

-- Command completion menu
vim.opt.wildmenu = true

-- Code folding
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = {"<center>", "</center>"}

-- Code indent
vim.opt.cindent = true
vim.opt.shiftwidth = 4

-- Not saving marks
vim.opt.viminfo = "'100,\"0"



