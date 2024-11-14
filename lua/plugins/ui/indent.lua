return {
    'lukas-reineke/indent-blankline.nvim', -- it could be integrated by many colorscheme
    main = 'ibl',

    config = function()
        --1 -- Define custom highlight groups for each indent level
        --1 vim.api.nvim_set_hl(0, "ScopeHighlight1", { fg = "seagreen" })

        -- Register hooks for scope highlighting
        local hooks = require("ibl.hooks")
        hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
        )

        -- Setup ibl with a list of scope highlight groups
        require("ibl").setup({
            indent = {
                -- │ ┃ ╎ ╏ ┆ ┇ ┊ ┋
                char = '┆',
            },
            whitespace = {
                remove_blankline_trail = false,
            },
            exclude = {
                filetypes = {
                    "help", "alpha", "dashboard", "nvim-tree",
                    "Trouble", "trouble", "lazy", "mason",
                    "notify", "toggleterm", "lazyterm",
                },
            },
            scope = {
                enabled = true,
                char = '┇',
                show_start = true,
                show_end = true,
                --2 highlight = { 
                --2     "ScopeHighlight1", 
                --2 } 
            }
        })
    end,
}


