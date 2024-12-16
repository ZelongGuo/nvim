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
    -- dependencies = {
    --     "rafamadriz/friendly-snippets",
    -- },

    config = function()
        local ls = require("luasnip")
        -- Use <Tab> (or some other key if you prefer) to trigger visual selection
        ls.config.set_config({
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        })

        -- if you want to undo the autoexpand, uncomment below
        local auto_expand = require("luasnip").expand_auto
        require("luasnip").expand_auto = function(...)
            vim.o.undolevels = vim.o.undolevels
            auto_expand(...)
        end

        require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnips/"})

        -------------------------------- key mapping ----------------------------------------------
        vim.keymap.set({ "i" }, "<C-q>", function() ls.expand() end, { noremap = true, silent = true })

        vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { noremap = true, silent = true })
        vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { noremap = true, silent = true })

        -- vim.keymap.set({ "i", "s" }, "<C-l>", function()
        --     if ls.locally_jumpable(1) then
        --         ls.jump(1)
        --     end
        -- end, { noremap = true, silent = true })

        -- vim.keymap.set({ "i", "s" }, "<C-j>", function()
        --     if ls.locally_jumpable(-1) then
        --         ls.jump(-1)
        --     end
        -- end, { noremap = true, silent = true })

        -- IF YOU WANT TO KEEP THE DEFAULT OPERATION FOR <C-L> <C-J>
        -- vim.keymap.set({ "i", "s" }, "<C-l>", function()
        --     if ls.locally_jumpable(1) then
        --         ls.jump(1)
        --     else
        --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Del>", true, false, true), "n", true)
        --     end
        -- end, { noremap = true, silent = true })

        -- vim.keymap.set({ "i", "s" }, "<C-j>", function()
        --     if ls.locally_jumpable(-1) then
        --         ls.jump(-1)
        --     else
        --         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-h>", true, false, true), "n", true)
        --     end
        -- end, { noremap = true, silent = true })

        vim.keymap.set({ "i", "s", "v" }, "<C-e>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { noremap = true, silent = true })
    end
}
