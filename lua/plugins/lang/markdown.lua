return {

    -- Makrdown table mode
    {
        'Kicamon/markdown-table-mode.nvim',
        ft = { "markdown" },

        config = function()
            -- all defaults settings
            require('markdown-table-mode').setup()
        end
    },

    -- Markdown Preview
    -- {
    -- 	"instant-markdown/vim-instant-markdown",
    -- 	ft = { "markdown" },
    -- 	build = "yarn install",
    -- 	config = function()
    --     vim.g.instant_markdown_slow = 0
    --     vim.g.instant_markdown_autostart = 0
    -- 	end,
    -- },
    --

    -- install with yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        ft = { "markdown" },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_theme = { "light" }

            vim.keymap.set('n', '<leader>R', ':MarkdownPreview<CR>', { noremap = false, silent = true })
            -- vim.keymap.set('n', 'E', ':MarkdownPreviewStop<CR>', { noremap = false, silent = true })
            -- vim.keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', { noremap = false, silent = true })
        end,
    },


    -- -- Markdown TOC, deprecated
    -- {
    --     'richardbizik/nvim-toc',
    --     ft = { "markdown" },
    --     config = function()
    --         require("nvim-toc").setup({
    --             toc_header = "Table of Contents"
    --         })

    --         -- Customized commad mappings
    --         vim.api.nvim_create_user_command("GenerateTOC", "TOC", {})
    --         vim.api.nvim_create_user_command("GenerateTOCList", "TOCList", {})
    --     end
    -- },

    -- Markdown TOC
    {
        "mzlogin/vim-markdown-toc",
        ft = { "markdown" },
        config = function()
            vim.g.vmt_fence_text              = 'TOC'
            vim.g.vmt_fence_closing_text      = 'TOC'
            vim.g.vmt_cycle_list_item_markers = 1
        end
    },

}
