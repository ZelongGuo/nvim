local M = {
    "zbirenbaum/copilot.lua", -- or "github/copilot.vim"
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
}

M.config = function()
    require('copilot').setup({

        -- disable copilot suggestion and panel to integrate with nvim-cmp
        suggestion = { enabled = false },
        panel = { enabled = false },

        -- panel = {
        --     enabled = true,
        --     auto_refresh = false,
        --     keymap = {
        --         jump_prev = "[[",
        --         jump_next = "]]",
        --         accept = "<CR>",
        --         refresh = "gr",
        --         open = "<M-CR>"
        --     },
        --     layout = {
        --         position = "bottom", -- | top | left | right | horizontal | vertical
        --         ratio = 0.4
        --     },
        -- },
        -- suggestion = {
        --     enabled = true,
        --     auto_trigger = false,
        --     hide_during_completion = true,
        --     debounce = 75,
        --     keymap = {
        --         accept = "ll", -- "<M-l>",
        --         accept_word = false,
        --         accept_line = false,
        --         next = "<C-l>",
        --         prev = "<C-j>",
        --         dismiss = "<C-k>",
        --     },
        -- },
        filetypes = {
            yaml = false,
            markdown = false,
            tex = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
            -- ["*"] = false, -- disable all other filetypes
        },
        -- copilot_node_command = 'node', -- Node.js version must be > 18.x
        -- server_opts_overrides = {},
    })
end

return M


-- local M = {
--     "Exafunction/codeium.nvim",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--         "hrsh7th/nvim-cmp",
--     },
--     config = function()
--         require("codeium").setup({
--         })
--     end

-- }

-- return M
