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
    build = "make install_jsregexp",
    lazy = true,
    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    config = function()
        local luasnip = require("luasnip")
        -- Use <Tab> (or some other key if you prefer) to trigger visual selection
        luasnip.config.set_config({ store_selection_keys = "<Tab>", })

        -- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnips/" })
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snips/" })

        -------------------------------- key mapping ----------------------------------------------
        vim.keymap.set({ "i" }, "<C-q>", function() luasnip.expand() end, { noremap = true, silent = true })

        vim.keymap.set({ "i", "s" }, "<C-l>", function() luasnip.jump(1) end, { noremap = true, silent = true })
        vim.keymap.set({ "i", "s" }, "<C-j>", function() luasnip.jump(-1) end, { noremap = true, silent = true })

        -- vim.keymap.set({ "i", "s" }, "<C-l>", function()
        --     if luasnip.locally_jumpable(1) then
        --         luasnip.jump(1)
        --     end
        -- end, { noremap = true, silent = true })

        -- vim.keymap.set({ "i", "s" }, "<C-j>", function()
        --     if luasnip.locally_jumpable(-1) then
        --         luasnip.jump(-1)
        --     end
        -- end, { noremap = true, silent = true })

        -- IF YOU WANT TO KEEP THE DEFAULT OPERATION FOR <C-L> <C-J>
        -- vim.keymap.set({ "i", "s" }, "<C-l>", function()
        --     if luasnip.locally_jumpable(1) then
        --         luasnip.jump(1)
        --     else
        --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Del>", true, false, true), "n", true)
        --     end
        -- end, { noremap = true, silent = true })

        -- vim.keymap.set({ "i", "s" }, "<C-j>", function()
        --     if luasnip.locally_jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-h>", true, false, true), "n", true)
        --     end
        -- end, { noremap = true, silent = true })

        vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { noremap = true, silent = true })
    end
}
