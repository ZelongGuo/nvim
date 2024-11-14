local M = {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },          -- source for LSP
        { "hrsh7th/cmp-buffer" },            -- source for text in buffer
        { "hrsh7th/cmp-path" },              -- source for file system paths
        { "hrsh7th/cmp-cmdline" },           -- source for path
        {
            "L3MON4D3/LuaSnip",              -- snippet engine
            version = "v2.*",                -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            build = "make install_jsregexp", -- install jsregexp (optional!).
        },
        "saadparwaiz1/cmp_luasnip",          -- for autocompletion
        "rafamadriz/friendly-snippets",      -- useful snippets
        "onsails/lspkind.nvim",              -- vs-code like pictograms/icons
        "f3fora/cmp-spell",                  -- English spell
        -- cmp-latex-symbols
    },
}

function M.config()
    local kind_icons = {
        Class = "󰯙", -- 🅒  ∴ 󰯙  󱗾  󰊲  󰸴  󰸵  󰸷  󰸶  󰸸  󱪴 󱪵  󰽘    󱥌  󱗼  󱗿 󱗽
        Color = '', --     󰌁  ☀  ⛭ 🖌   󰉦  󰸱 󰃉
        Constant = "𝜋", -- π 𝜋   󰏿
        Constructor = "⬡", -- ⌬  ⎔  ⚙ 
        Enum = "", -- 󰒼          󰖽  󰖿  󰒺    󰎠  
        EnumMember = "",
        Event = "", --  
        Field = "󰽏", --   󰽏  󰠴  󰽐  󰽑  󱪲    →  ∴ 
        File = "", -- 󰈔                   
        Folder = "", --                        
        Function = "ƒ", -- 󰡱  λ ƒ 󰊕  󰘧  󱈚 󰯻  󰬍  󰀫 
        Interface = "",
        Keyword = "󰌋", --   🗝      󰌆  󰌇  󱆟  󰷖  󱌒 󱕴  󱜥  󱆅    󰌓    󰌋
        Method = "𝘮", --   𝘮  λ      
        Module = "", -- 📦       󰆧  󱃲  󰙳  󰫈
        Operator = '', -- ≠  ±    󱓉  
        Property = "󰗣", --   󰗣    ∷
        Reference = "", --      ⌦   ⊷  ⊶  ⊸
        Snippet = " ", --     ↲  ♢  <> {}            󰅩  󰅨  󰅪  󰘦  󰈮    󰅬  󰅮  󰅭  󰅯  󰅱  󰅵
        Struct = "", --             
        Text = "󰗊", -- #  ♯  ⅵ  ¶  𝒯  󰘎  󱂕  󰴑    󰗧  󰊄  󰙩  󱄽  󰚞  󰸲  󱔏  𝓣  𐄗     󰬶  󰬵  󰉷  󰉿  󰗴 󰗊 󱂂
        TypeParameter = "×",
        Unit = "()", -- 󰕤
        -- Value           =  --   󰎠
        Variable = "α", -- 󰀫 𝛼 α 𝓧  χ  𝛸   󰫧  󱄑  󱃻    󱀍  󰑱  󱌲  󱓉  󰒻  󱗖   ≔  󱃮
        Copilot = "󰚩", --                       󰢚    󰜈  󰚩
    }
    --   󰥮 󰟍   󱍢     󰆚  󰅠        󱌱 󰹪      󰅩 󰉾 󰨮            󰂦  󰗊  
    -- other symbols that might be useful for something: -- ⊕ † ፨ ᯾ ⁂ ∎ ∹ ☖ ⚐ ⬠  ⬡   ⟡ ✐  ✎ ꒾꙳ ꥟ ⤙ ⤚ ⤛ ⤜

    local cmp = require("cmp")
    local luasnip = require("luasnip")

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
            -- ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            -- ["<Tab>"] = cmp.mapping.select_next_item(),   -- next suggestion
            ["<C-i>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-k>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-j>"] = cmp.mapping.scroll_docs(-4),
            ["<C-l>"] = cmp.mapping.scroll_docs(4),
            ["<C-s>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-c>"] = cmp.mapping.abort(),    -- close completion window
            ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({             -- sources for autocompletion
            { name = "nvim_lsp", priority = 1000 },
            { name = "buffer",   priority = 900 }, -- text within current buffer
            { name = "path",     priority = 800 }, -- file system paths
            { name = "luasnip",  priority = 700 }, -- snippets
            {
                name = 'spell',
                priority = 500,
                option = {
                    enable_in_context = function()
                        return require('cmp.config.context').in_treesitter_capture('spell')
                    end,
                },
            },
        }),

        window = { -- window box better for light scheme
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
            -- completion = { border = "rounded" },
            -- documentation = { border = "rounded" },
            completion = {
                border = "rounded", -- single, double, none, rounded
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = "rounded",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            },
        },

        -- local lspkind = require("lspkind")
        -- formatting = { -- configure lspkind for vs-code like pictograms in completion menu
        --     format = lspkind.cmp_format({
        --         maxwidth = 50,
        --         ellipsis_char = "...",
        --     }),
        -- },

        formatting = {
            -- fields = { "kind", "abbr", "menu" },
            fields = { "abbr", "kind", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
                vim_item.menu = ({
                    -- omni = "[VimTex]",
                    omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    spell = "[Spell]",
                    latex_symbols = "[Symbols]",
                    cmdline = "[CMD]",
                    path = "[Path]",
                    copilot = "[Copilot]",
                })[entry.source.name]
                return vim_item
            end,
        }
    })
end

return M
