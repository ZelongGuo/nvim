return {
    -- :set filetype=tex if vimtex cannot loaded successfully
    --
    "lervag/vimtex",
    lazy = false,
    priority = 1100,
    init = function()
        vim.g.vimtex_view_method = "skim"
        -- vim.g.vimtex_mappings_enabled = 0
        -- vim.g.vimtex_quickfix_open_on_warning = 0  -- 0 for not opening quickfix for warnings
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
        vim.g.vimtex_matchparen_enabled = 0 -- disable this option to speed vim up
        vim.g.vimtex_syntax_enabled = 0
        vim.g.vimtex_syntax_conceal_disable = 1
    end,

    --  After plugin loaded, change the keymap in TOC Buffer
    config = function()
        vim.g.vimtex_toc_enabled = 1

        vim.g.vimtex_toc_config = {
            name = "Table of Contents",
            indent_levels = 1, -- enable indent of section levels

            -- layers = { "content", "label", "todo", "include" },
            layers = { "content", "label", "todo" }, -- include is hidden to avoid "I" keymap conflict
            split_width = 40,
        }

        -- Open TOC and remap the key, I --> move 5 lines up
        local function open_toc_and_remap()
            vim.cmd("VimtexTocOpen")
            vim.keymap.set("n", "I", "5k", { buffer = true, silent = true })
        end

        vim.keymap.set("n", ",lt", open_toc_and_remap, { silent = true })
    end
}
