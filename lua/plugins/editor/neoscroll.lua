return {
    "karb94/neoscroll.nvim",
    lazy = true,
    keys = { "<C-u>", "<C-d>", "zz", "zt", "zb" },

    config = function()
        local neoscroll = require('neoscroll')
        neoscroll.setup({
            -- mappings = { -- Keys to be mapped to their corresponding default scrolling animation
            --     '<C-u>', '<C-d>',
            --     '<C-b>', '<C-f>',
            --     '<C-y>', '<C-e>',
            --     'zt', 'zz', 'zb',
            -- },
            mappings = {},               -- Disable all the default mappings
            hide_cursor = false,         -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            -- easing = 'linear',       -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
            ignored_events = {           -- Events ignored while scrolling
                'WinScrolled', 'CursorMoved'
            },
        })

        local keymap = {
            -- Use the "sine" easing function
            ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 350, easing = 'linear' }) end,
            ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 350, easing = 'liner' }) end,
            -- Use the "circular" easing function
            ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450, easing = 'linear' }) end,
            ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450, easing = 'linear' }) end,
            -- When no value is passed the `easing` option supplied in `setup()` is used
            -- Disable <C-y> and <C-e>
            -- ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
            -- ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
        }
        -- local modes = { 'n', 'v', 'x' }
        -- Only for normal mode avoiding luasnip node choices <C-e>
        local modes = { 'n', }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end
}
