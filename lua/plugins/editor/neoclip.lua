-- Register foyr yank/copy shortcuts, this plugin could be integrated with TELESCOPE
-- Telescope has its builtin registers but only related with the vim defaults registers
local M = {
    "AckslD/nvim-neoclip.lua",
    -- event = "TextYankPost", -- should be preloaded before telescope
    ft = {"markdown", "tex", "latex"},
    keys = { "<leader>fy", ":Telescope neoclip<CR>", desc = "open neoclip within telescope" },
    dependencies = {
        {'kkharji/sqlite.lua', module = 'sqlite'},  -- for persistent history between sessions
        'nvim-telescope/telescope.nvim',
        -- 'ibhagwan/fzf-lua',
    },
}

function M.config()
    vim.keymap.set('n', '<leader>fy', ":Telescope neoclip<CR>", { desc = 'open neoclip plugin for yank and macro' })

    local neoclip = require("neoclip")

    neoclip.setup({
        history = 1000,
        enable_persistent_history = true,
        length_limit = 1048576,  -- 1MB
        continuous_sync = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3", -- which is under ~/.local/share/nvim/
        filter = nil,
        preview = true,
        prompt = nil,
        default_register = '"',
        default_register_macros = 'q',
        enable_macro_history = true,
        content_spec_column = false,
        disable_keycodes_parsing = false,
        on_select = {
            move_to_front = false,
            close_telescope = true,
        },
        on_paste = {
            set_reg = false,
            move_to_front = false,
            close_telescope = true,
        },
        on_replay = {
            set_reg = false,
            move_to_front = false,
            close_telescope = true,
        },
        on_custom_action = {
            close_telescope = true,
        },
        keys = {
            telescope = {
                i = {
                    select = '<cr>',
                    paste = '<c-p>',
                    paste_behind = '<c-k>',
                    replay = '<c-q>',  -- replay a macro
                    delete = '<c-d>',  -- delete an entry
                    edit = '<c-e>',  -- edit an entry
                    custom = {},
                },
                n = {
                    select = '<cr>',
                    paste = 'p',
                    --- It is possible to map to more than one key.
                    -- paste = { 'p', '<c-p>' },
                    paste_behind = 'P',
                    replay = 'q',
                    delete = 'd',
                    edit = 'e',
                    custom = {},
                },
            },
            fzf = {
                select = 'default',
                paste = 'ctrl-p',
                paste_behind = 'ctrl-k',
                custom = {},
            },
        },

    })

end

return M
