-- return {
--     {
--         "SirVer/ultisnips",
--         dependencies = {
--             "honza/vim-snippets",
--         },
--         config = function()
--             vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/ultisnips" }
--             vim.g.UltiSnipsExpandTrigger = "<C-q>"
--             vim.g.UltiSnipsJumpForwardTrigger = "<C-q>"
--             vim.g.UltiSnipsJumpBackwardTrigger = "<C-w>"
--         end,
--     },
-- }
--

return {
    "L3MON4D3/LuaSnip",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    lazy = true,
    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    config = function()
        local luasnip = require("luasnip")

        vim.keymap.set({ "i" }, "<C-q>", function() luasnip.expand() end, { noremap = true, silent = true })
        -- Setting jumping in nvim-cmp.lua to avoid key conflicts, or add a if condition below
        -- vim.keymap.set({ "i", "s" }, "<Tab>", function() luasnip.jump(1) end, { noremap = true, silent = true })
        -- vim.keymap.set({ "i", "s" }, "<S-Tab>", function() luasnip.jump(-1) end, { noremap = true, silent = true })

        vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { noremap = true, silent = true })
    end
}
