local M = {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/cmp-buffer",  -- source for text in buffer
        "hrsh7th/cmp-path",    -- source for file system paths
        {
            "L3MON4D3/LuaSnip",  -- snippet engine
            version = "v2.*",    -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            build = "make install_jsregexp", -- install jsregexp (optional!).
        },
        "saadparwaiz1/cmp_luasnip",     -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim",         -- vs-code like pictograms
        "f3fora/cmp-spell",             -- English spell
    },
}

function M.config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
        completion = {
            completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
        },

        mapping = cmp.mapping.preset.insert({
            -- TODO ...
            ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<Down>"] = cmp.mapping.scroll_docs(-4),
            ["<Up>"] = cmp.mapping.scroll_docs(4),
            ["<C-o>"] = cmp.mapping.complete(),         -- show completion suggestions
            ["<C-c>"] = cmp.mapping.abort(),            -- close completion window
            ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({ -- sources for autocompletion
            { name = "nvim_lsp"},
            { name = "luasnip" }, -- snippets
            { name = "buffer" },  -- text within current buffer
            { name = "path" },    -- file system paths
            {
              name = 'spell',
              option = {
                enable_in_context = function()
                  return require('cmp.config.context').in_treesitter_capture('spell')
                end,
              },
            },
        }),

        window = {  -- window box better for light scheme
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        formatting = { -- configure lspkind for vs-code like pictograms in completion menu
            format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
            }),
        },
    })
end

return M

--1 return {
--1   "hrsh7th/nvim-cmp",
--1   -- event = { "InsertEnter", "CmdlineEnter" },
--1   event = { "InsertEnter" },
--1   dependencies = {
--1     "hrsh7th/cmp-buffer",  -- source for text in buffer
--1     "hrsh7th/cmp-path",    -- source for file system paths
--1     {
--1       "L3MON4D3/LuaSnip",  -- snippet engine
--1       -- follow latest release.
--1       version = "v2.*",    -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--1       -- install jsregexp (optional!).
--1       build = "make install_jsregexp",
--1     },
--1     "saadparwaiz1/cmp_luasnip",     -- for autocompletion
--1     "rafamadriz/friendly-snippets", -- useful snippets
--1     "onsails/lspkind.nvim",         -- vs-code like pictograms
--1     {
--1       "f3fora/cmp-spell",             -- English spell
--1     }
--1   },
--1   config = function()
--1     local cmp = require("cmp")
--1 
--1     local luasnip = require("luasnip")
--1 
--1     local lspkind = require("lspkind")
--1 
--1     -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
--1     require("luasnip.loaders.from_vscode").lazy_load()
--1 
--1     cmp.setup({
--1       completion = {
--1         completeopt = "menu,menuone,preview,noselect",
--1       },
--1       snippet = { -- configure how nvim-cmp interacts with snippet engine
--1         expand = function(args)
--1           luasnip.lsp_expand(args.body)
--1         end,
--1       },
--1       mapping = cmp.mapping.preset.insert({
--1         -- TODO ...
--1         ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--1         ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
--1         ["<Down>"] = cmp.mapping.scroll_docs(-4),
--1         ["<Up>"] = cmp.mapping.scroll_docs(4),
--1         ["<C-o>"] = cmp.mapping.complete(),         -- show completion suggestions
--1         ["<C-c>"] = cmp.mapping.abort(),            -- close completion window
--1         ["<CR>"]  = cmp.mapping.confirm({ select = true }),
--1       }),
--1       -- sources for autocompletion
--1       sources = cmp.config.sources({
--1         { name = "nvim_lsp"},
--1         { name = "luasnip" }, -- snippets
--1         { name = "buffer" },  -- text within current buffer
--1         { name = "path" },    -- file system paths
--1       }),
--1 
--1       window = {  -- window box better for light scheme
--1         completion = cmp.config.window.bordered(),
--1         documentation = cmp.config.window.bordered(),
--1       },
--1 
--1       -- configure lspkind for vs-code like pictograms in completion menu
--1       formatting = {
--1         format = lspkind.cmp_format({
--1           maxwidth = 50,
--1           ellipsis_char = "...",
--1         }),
--1       },
--1     })
--1   end,
--1 }
--1 
