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
        "onsails/lspkind.nvim",         -- vs-code like pictograms/icons
        "f3fora/cmp-spell",             -- English spell
        -- cmp-latex-symbols
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
        snippet = {  -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
        },

        mapping = cmp.mapping.preset.insert({
            -- TODO ...
            ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<Tab>"] = cmp.mapping.select_next_item(),   -- next suggestion
            ["<Down>"] = cmp.mapping.scroll_docs(-4),
            ["<Up>"] = cmp.mapping.scroll_docs(4),
            ["<C-o>"] = cmp.mapping.complete(),           -- show completion suggestions
            ["<C-c>"] = cmp.mapping.abort(),              -- close completion window
            ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({ -- sources for autocompletion
            { name = "nvim_lsp", priority = 1000},
            { name = "luasnip",  priority = 900 },    -- snippets
            { name = "buffer",   priority = 800 },    -- text within current buffer
            { name = "path",     priority = 700 },    -- file system paths
            {
              name = 'spell', priority = 500, option = {
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

