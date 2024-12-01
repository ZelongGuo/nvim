------------------------------------- Luasnip Builtins ---------------------------------------------
-- local ls = require("luasnip")
-- -- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local f = ls.function_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta

local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

--------------------------------------- Math Context ----------------------------------------------
-- NOTE: the dependency is VimTex
-- local tex = {}
-- tex.in_mathzone = function()
--     return vim.fn['vimtex#syntax#in_mathzone']() == 1
-- end
-- tex.in_text = function()
--     return not tex.in_mathzone()
-- end

local in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
local in_text = function()
    return not in_mathzone()
end

-- local function create_snippets_for_markdown()
local snippets = {
    --------------------------------------- Math -------------------------------------------------
    s(
        { trig = "mi", dscr = "math inline", wordTrig = true },
        fmta([[$<>$]], { d(1, get_visual) })
    ),
    s(
        { trig = "mo", dscr = "math outline", wordTrig = true },
        fmta([[
        $$
        <>
        $$
        ]], { d(1, get_visual) })
    ),

    s(
        { trig = "fr", dscr = "Equal Alignment", wordTrig = true, snippetType = "autosnippet" },
        fmta([[\frac{<>}{<>}]], { i(1), i(2) }),
        -- { condition = tex.in_mathzone }
        { condition = in_mathzone }
    )

    -- s(
    --     {
    --         trig = "([^%a])mi",  -- Expand only after Not letters
    --         dscr = "math inline",
    --         wordTrig = false,
    --         regTrig = true,
    --         snippetType = "autosnippet"
    --     },
    --     fmta(
    --         [[<>$<>$]],
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     )
    -- ),

    -- s(
    --     {
    --         trig = "([^%a])mo",  -- Expand only after Not letters
    --         dscr = "math inline",
    --         wordTrig = false,
    --         regTrig = true,
    --         snippetType = "autosnippet"
    --     },
    --     fmta(
    --         [[<>
    --         $$
    --         <>
    --         $$]],
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     )
    -- ),


}

return snippets

-- -- Helper function to define a snippet
-- local function define_snippet(trig, dscr, nodes, opts)
--     opts = opts or {}
--     opts.trig = trig
--     opts.dscr = dscr
--     opts.regTrig = opts.regTrig or false
--     opts.wordTrig = opts.wordTrig or false
--     opts.priority = opts.priority or 1000
--     opts.snippetType = opts.snippetType or "autosnippet" -- snippet or autosnippet
--     table.insert(snippets, s(opts, nodes))
-- end

-- return snippets

-- --------------------------------------- Math -------------------------------------------------
-- local math = {
--     {
--         trig = "mi",
--         dscr = "math inline",
--         nodes = fmta([[$<>$]], { d(1, get_visual) }),
--         opts = { wordTrig = false, priority = 1000 }
--     },
--     {
--         trig = "mo",
--         dscr = "math outline",
--         nodes = fmta([[
--             $$
--             <>
--             $$
--             ]], { d(1, get_visual) })
--     },
--     {
--         trig = "/",
--         dscr = "Fraction",
--         nodes = fmta([[\frac{<>}{<>}]], { i(1), i(2) }),
--         opts = { wordTrig = true }
--     },
--     -- {
--     --     trig = "==",
--     --     dscr = "Equal Alignment",
--     --     -- nodes = fmta([[`<>`]], { d(1, get_visual) })
--     --     nodes = t(" & = ")
--     -- }
-- }

-- for _, pair in ipairs(math) do
--     define_snippet(pair.trig, pair.dscr, pair.nodes, pair.opts)
-- end


-- return snippets
-- -- end

-- -- ls.add_snippets("all", create_snippets_for_markdown())
