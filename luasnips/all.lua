-- local ls = require("luasnip")
-- local s = ls.snippet
-- -- local sn = ls.snippet_node
-- -- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- -- local f = ls.function_node
-- -- local c = ls.choice_node
-- local d = ls.dynamic_node
-- -- local r = ls.restore_node
-- -- local events = require("luasnip.util.events")
-- -- local ai = require("luasnip.nodes.absolute_indexer")
-- -- local extras = require("luasnip.extras")
-- -- local l = extras.lambda
-- -- local rep = extras.rep
-- -- local p = extras.partial
-- -- local m = extras.match
-- -- local n = extras.nonempty
-- -- local dl = extras.dynamic_lambda
-- -- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- -- local conds = require("luasnip.extras.expand_conditions")
-- -- local postfix = require("luasnip.extras.postfix").postfix
-- -- local types = require("luasnip.util.types")
-- -- local parse = require("luasnip.util.parser").parse_snippet
-- -- local ms = ls.multi_snippet
-- -- local k = require("luasnip.nodes.key_indexer").new_key

-- local helper = require("utils.luasnip-helper-funcs")
-- local get_visual = helper.get_visual

-- local M = {
--     -------------------------------------- Parenthesis ---------------------------------------
--     s(
--         {
--             trig = "%(%)",
--             dscr = "Parenthesis",
--             regTrig = false,
--             wordTrig = false,
--             priority = 1000,
--             snippetType = "autosnippet"
--         },
--         { t("("), i(1), t(")") }
--     ),

--     s(
--         {
--             trig = "%[%]",
--             dscr = "Parenthesis",
--             regTrig = false,
--             wordTrig = false,
--             priority = 1000,
--             snippetType = "autosnippet"
--         },
--         { t("["), i(1), t("]") }
--     ),

--     s(
--         {
--             trig = "{}",
--             dscr = "Parenthesis",
--             regTrig = false,
--             wordTrig = false,
--             priority = 1000,
--             snippetType = "autosnippet"
--         },
--         { t("{"), i(1), t("}") }
--     ),

--     s(
--         {
--             trig = "<>",
--             dscr = "Parenthesis",
--             regTrig = false,
--             wordTrig = false,
--             priority = 1000,
--             snippetType = "autosnippet"
--         },
--         { t("<"), i(1), t(">") }
--     ),

--     ----------------------------------------- Quotation ---------------------------------------
--     s(
--         {
--             trig = '""',
--             dscr = "Quotation",
--             regTrig = false,
--             wordTrig = false,
--             priority = 1000,
--             snippetType = "autosnippet"
--         },
--         { t('"'), i(1), t('"') }
--     ),

--     s(
--         {
--             trig = "''",
--             dscr = "Quotation",
--             regTrig = false,
--             wordTrig = false,
--             priority = 1000,
--             snippetType = "autosnippet"
--         },
--         { t("'"), i(1), t("'") }
--     ),

--     ------------------------------------------------------------------------------------------
--     s({ trig = "hii", snippetType = "autosnippet" }, -- explicitly setting trigger via params table
--         { t(" Hello, world!!!!!! "), }
--     ),

--     s({ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command.", snippetType = "autosnippet" },
--         fmta("\\textit{<>}",
--             {
--                 d(1, get_visual),
--             }
--         )
--     ),

-- }

-- return M


local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

local snippets = {}
local pairs = {
    { trig = "%(%)", open = "(", close = ")" },
    { trig = "%[%]", open = "[", close = "]" },
    { trig = "{}",   open = "{", close = "}" },
    { trig = "<>",   open = "<", close = ">" },
    { trig = '""',   open = '"', close = '"' },
    { trig = "''",   open = "'", close = "'" },
}

local function create_snippets_from_pairs()
    for _, pair in ipairs(pairs) do
        table.insert(snippets,
            s(
                {
                    trig = pair.trig,
                    dscr = "Autopair for " .. pair.open .. pair.close,
                    regTrig = false,
                    wordTrig = false,
                    priority = 1000,
                    snippetType = "autosnippet",
                },
                fmt(
                    [[{open}{node}{close}]],
                    {
                        open = t(pair.open),
                        node = d(1, get_visual),
                        close = t(pair.close),
                    },
                    { delimiters = "{}" }
                )
            )
        )
    end

    return snippets
end

ls.add_snippets("all", create_snippets_from_pairs())
