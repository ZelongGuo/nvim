return {
    -- :set filetype=tex if vimtex cannot loaded successfully
    --
    "lervag/vimtex",
    lazy = false,
    priority = 1100,
    init = function()
        vim.g.vimtex_view_method = "skim"
        -- vim.g.vimtex_mappings_enabled = 0
        vim.g.vimtex_quickfix_ignore_filters = {
            'Font shape',
            "badness 10000",
            -- Chinese Fonts Support Warning, check font book for fonts available on you Mac
            'Package fontspec Warning',
            -- 	"Package hyperref Warning",
            -- 	Package xeCJK Warning: Redefining CJKfamily `\CJKrmdefault'
            "Package xeCJK Warning",
        }
        -- vim.g.maplocalleader = ',' -- cannot declare here because the maplocalleader should be
        -- specified before lazy.nvim
    end
}
