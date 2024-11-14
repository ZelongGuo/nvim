return {

    'akinsho/bufferline.nvim',
    event = "UIEnter",

    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- Configuring the plugin
    opts = {
        options = {
            mode = "tabs", -- tabs, buffers
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                -- style = 'icon' | 'underline' | 'none',
                style = "icon",
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            enforce_regular_tabs = true,
            show_duplicate_prefix = false,
            tab_size = 16,
            padding = 0,
            separator_style = "thick",

            -- numbers = "both"  function({ ordinal, id, lower, raise }): string,
            -- For 8|² -
            numbers = function(opts)
                -- return string.format('%s|%s', opts.id, opts.raise(opts.ordinal) )
                return string.format('%s|%s', opts.ordinal, opts.raise(opts.id))
            end,
        },

        -- Here we should set key mappings outside of the options table
        -- because vim.keymap.set is not part of bufferline's options

        -- Setting key mappings to fast jump between tabs
        -- This part should be outside the opts table
        vim.keymap.set('n', 't1', function() require("bufferline").go_to(1, true) end,
            { noremap = true, silent = true, desc = 'go the 1st tab' }),
        vim.keymap.set('n', 't2', function() require("bufferline").go_to(2, true) end,
            { noremap = true, silent = true, desc = 'go the 2nd tab' }),
        vim.keymap.set('n', 't3', function() require("bufferline").go_to(3, true) end,
            { noremap = true, silent = true, desc = 'go the 3rd tab' }),
        vim.keymap.set('n', 't4', function() require("bufferline").go_to(4, true) end,
            { noremap = true, silent = true, desc = 'go the 4th tab' }),
        vim.keymap.set('n', 't5', function() require("bufferline").go_to(5, true) end,
            { noremap = true, silent = true, desc = 'go the 5th tab' }),
        vim.keymap.set('n', 't6', function() require("bufferline").go_to(6, true) end,
            { noremap = true, silent = true, desc = 'go the 6th tab' }),
        vim.keymap.set('n', 't7', function() require("bufferline").go_to(7, true) end,
            { noremap = true, silent = true, desc = 'go the 7th tab' }),
        vim.keymap.set('n', 't8', function() require("bufferline").go_to(8, true) end,
            { noremap = true, silent = true, desc = 'go the 8th tab' }),
        vim.keymap.set('n', 't9', function() require("bufferline").go_to(9, true) end,
            { noremap = true, silent = true, desc = 'go the 9th tab' }),
        vim.keymap.set('n', 't<C-l>', function() require("bufferline").go_to(-1, true) end,
            { noremap = true, silent = true, desc = 'go the last tab' }),
        vim.keymap.set('n', 't<C-j>', function() require("bufferline").go_to(1, true) end,
            { noremap = true, silent = true, desc = 'go the 1st tab' }),
    }
}
