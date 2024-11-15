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

----------------------------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })

-- Lazy_cmd for configure lazy.vim, the setting is in "~/.local/share/nvim/lazy/lazy.nvim/lua/view/congfig.lua"
local lazy_view_config = require("lazy.view.config")

local keys = lazy_view_config.keys
keys.hover = "<Space>go" -- Go to the GitHub link
keys.diff = "d"
keys.close = "q"
keys.details = "<CR>"
keys.profile_sort = "<C-s>"
keys.profile_filter = "<C-f>"
keys.abort = "<C-c>"
keys.next = "]]"
keys.prev = "[["

local keybindings = {
    { cmd = "install", key = "i" },
    { cmd = "update",  key = "u" },
    { cmd = "sync",    key = "s" },
    { cmd = "clean",   key = "cl" },
    { cmd = "check",   key = "ch" },
    { cmd = "log",     key = "l" },
    { cmd = "restore", key = "rs" },
    { cmd = "profile", key = "p" },
    { cmd = "debug",   key = "d" },
    --{ cmd = "health",   key = "d" },
    --{ cmd = "help",    key = "h" },
    -- { cmd = "clear",   key = "C" },
}

local lazy_cmd = lazy_view_config.commands

for _, v in ipairs(keybindings) do
    -- For main interface
    lazy_cmd[v.cmd].key = "<Space>" .. string.upper(v.key)
    -- For a specific plugin
    lazy_cmd[v.cmd].key_plugin = "<Space>" .. v.key
end
-- require("lazy.view.config").commands.install.key_plugin = "<nop>"

----------------------------------------------------------------------------------------------------

-- Setup lazy.nvim
require("lazy").setup({

    -- Colorschemes, status line, buffer line and colorizer, startup, nvim-tree
    { import = "plugins.ui" }, -- require("plugins.ui.colorizer")

    -- Indent line and folding
    { import = "plugins.editor" },
    -- require("plugins.fold"),

    -- Markdowns, Tex
    { import = "plugins.lang" },
    { import = "plugins.lsp" },

    -- Searching files and text
    require("plugins.nvim-tree"), -- TODO
    require("plugins.telescope"), -- TODO
    require("plugins.git"),
    require("plugins.tree-sitter"),
    require("plugins.nvim-cmp"),

    -- Snippets
    -- require("plugins.snippets"), -- UltiSnips
    --
    --

})
