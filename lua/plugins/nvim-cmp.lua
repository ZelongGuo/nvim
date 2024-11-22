local M = {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    -- TODO: looking fomr more completion dependencies ...
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" }, -- source for LSP
        { "hrsh7th/cmp-buffer" },   -- source for text in buffer
        { "hrsh7th/cmp-path" },     -- source for file system paths
        -- { "hrsh7th/cmp-cmdline" },          -- source for path
        { 'L3MON4D3/LuaSnip', dependencies = { "rafamadriz/friendly-snippets" } },
        { "saadparwaiz1/cmp_luasnip" },     -- for luasnip autocompletion
        { "onsails/lspkind.nvim", },        -- vs-code like pictograms/icons
        { "f3fora/cmp-spell", },            -- English spell
        { "kdheepak/cmp-latex-symbols", },
        -- "zbirenbaum/copilot-cmp",         -- "zbirenbaum/copilot.lua" is needed firstly
        -- "micangl/cmp-vimtex"
    },
}

function M.config()
    local kind_icons = {
        Class = "󰯙", -- 🅒  ∴ 󰯙  󱗾  󰊲  󰸴  󰸵  󰸷  󰸶  󰸸  󱪴 󱪵  󰽘    󱥌  󱗼  󱗿 󱗽 
        Color = '', --     󰌁  ☀  ⛭   󰉦  󰸱 󰃉
        Constant = "𝜋", -- π 𝜋   󰏿
        Constructor = "⬡", -- ⌬  ⎔  ⚙ 
        Enum = "", -- 󰒼          󰖽  󰖿  󰒺    󰎠  
        EnumMember = "",
        Event = "", --  
        Field = "󰽏", --   󰽏  󰠴  󰽐  󰽑  󱪲    →  ∴ 
        File = "󰈙", -- 󰈔                     󰈙  󰷈  󰧮  󱇨  󱏒
        Folder = "", --                            󱃪  󰉓
        Function = "ƒ", -- 󰡱  λ ƒ 󰊕  󰘧  󱈚 󰯻  󰬍  󰀫 
        Interface = "",
        Keyword = "󰌋", --   🗝      󰌆  󰌇  󱆟  󰷖  󱌒 󱕴  󱜥  󱆅    󰌓    󰌋
        Method = "𝘮", --   𝘮  λ      
        Module = "", -- 📦       󰆧  󱃲  󰙳  󰫈
        Operator = '', -- ≠  ±    󱓉  
        Property = "󰗣", --   󰗣    ∷
        Reference = "", --      ⌦   ⊷  ⊶  ⊸
        Snippet = "󰅱", --     ↲  ♢  <> {}            󰅩  󰅨  󰅪  󰘦  󰈮    󰅬  󰅮  󰅭  󰅯  󰅱  󰅵
        Struct = "", --             
        Text = "󰗊", -- #  ♯  ⅵ  ¶  𝒯  󰘎  󱂕  󰴑    󰗧  󰊄  󰙩  󱄽  󰚞  󰸲  󱔏  𝓣  𐄗     󰬶  󰬵  󰉷  󰉿  󰗴 󰗊 󱂂
        TypeParameter = "×",
        Unit = "()", -- 󰕤
        Value = "󰎠", --   󰎠
        Variable = "α", -- 󰀫 𝛼 α 𝓧  χ  𝛸   󰫧  󱄑  󱃻    󱀍  󰑱  󱌲  󱓉  󰒻  󱗖   ≔  󱃮
        Copilot = "󰚩", --                       󰢚    󰜈  󰚩
    }
    --   󰥮 󰟍   󱍢     󰆚  󰅠        󱌱 󰹪      󰅩 󰉾 󰨮            󰂦  󰗊  
    -- other symbols that might be useful for something: -- ⊕ † ፨ ᯾ ⁂ ∎ ∹ ☖ ⚐ ⬠  ⬡   ⟡ ✐  ✎ ꒾꙳ ꥟ ⤙ ⤚ ⤛ ⤜

    local cmp = require("cmp")
    local ls = require("luasnip")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({

        completion = {
            completeopt = "menu,menuone,preview,noselect",
        },

        snippet = { -- configure how nvim-cmp interacts with snippet engine (luasnip here)
            expand = function(args)
                ls.lsp_expand(args.body)
            end,
        },

        mapping = cmp.mapping.preset.insert({
            ["<Tab>"]   = cmp.mapping(function(fallback)
                if cmp.visible() then
                    -- cmp.select_next_item()
                    cmp.select_prev_item() -- <tab> is intrinsicly same to <C-i>!
                elseif ls.locally_jumpable(1) then
                    ls.jump(1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-i>"]   = cmp.mapping(function(fallback)
                if cmp.visible() then
                    -- cmp.select_next_item()
                    cmp.select_prev_item() -- <tab> is intrinsicly same to <c-i>!
                elseif ls.locally_jumpable(1) then
                    ls.jump(1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    -- cmp.select_prev_item()
                    cmp.select_next_item()
                elseif ls.locally_jumpable(-1) then
                    ls.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<CR>"]    = cmp.mapping(function(fallback)
                if cmp.visible() then
                    if ls.expandable() then
                        ls.expand()
                    else
                        cmp.confirm({ select = true })
                    end
                else
                    fallback()
                end
            end),

            -- ['I']   = cmp.mapping(function(fallback)
            --     if cmp.visible() then
            --         return cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 4 })
            --     end
            --     fallback()
            -- end, { 'i', }),

            -- ['K']   = cmp.mapping(function(fallback)
            --     if cmp.visible() then
            --         return cmp.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 4 })
            --     end
            --     fallback()
            -- end, { 'i', }),

            ["<C-k>"]   = cmp.mapping.select_next_item(), -- next suggestion
            -- ["<C-j>"]   = function() end, -- Force disbale
            -- ["<C-l>"]   = function() end,
            ["<C-u>"]   = cmp.mapping.scroll_docs(-4),
            ["<C-d>"]   = cmp.mapping.scroll_docs(4),
            ["<C-s>"]   = cmp.mapping.complete(), -- show completion suggestions
            ["<C-c>"]   = cmp.mapping.abort(),    -- close completion window
        }),
        sources = cmp.config.sources({ -- sources for autocompletion
            -- TODO: Disable / Enable cmp sources only on certain buffers, and for certain filetypes
            { name = "nvim_lsp",      priority = 1000 },
            { name = "buffer",        priority = 900 }, -- text within current buffer
            { name = "path",          priority = 800 }, -- file system paths
            { name = "luasnip",       priority = 700 }, -- snippets
            { name = "latex_symbols", priority = 500 }, -- latex_symbols
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

        experimental = {
            ghost_text = false -- this feature conflict with copilot.vim's preview.
        },

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
                    latex_symbols = "[Latex]",
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
