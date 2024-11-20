-- local M = {
--     "zbirenbaum/copilot.lua",
--     lazy = true,
--     cmd = "Copilot",
--     event = "InsertEnter",
-- }

-- M.congig = function()
--     require('copilot').setup({
--         suggestion = {
--             enabled = true,
--             auto_trigger = false,
--             hide_during_completion = true,
--             debounce = 75,
--             keymap = {
--                 accept = "ll", -- "<M-l>",
--                 accept_word = false,
--                 accept_line = false,
--                 next = "<C-l>",
--                 prev = "<C-j>",
--                 dismiss = "<C-k>",
--             },
--         },
--     })
-- end



-- return M


local M = {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end

}

return M
