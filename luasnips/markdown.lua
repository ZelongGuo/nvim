local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

-- local ls = require("luasnip")
-- local s = ls.snippet
-- local i = ls.insert_node
-- local t = ls.text_node



local function create_snippets_for_markdown()
    local snippets = {}
    --------------------------------------- Pairs -------------------------------------------------
    local pairs = {
        { trig = ",i", open = "*",  close = "*" },
        { trig = ",b", open = "**", close = "**" },
        { trig = ",d", open = "~~", close = "~~" },
        { trig = ",q", open = "`",  close = "`" },
    }

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

    --------------------------------------- Others -------------------------------------------------
    -- local others = {
    --     { trig = ',c', open = '```',                  close = '```' },
    --     { trig = ",m", open = "- [ ]" },
    --     { trig = ",p", open = "![display name](link)" }, -- TODO: add choice_node
    --     { trig = ",a", open = "[display name](link)" },

    -- }
    table.insert(snippets,
        s(
            {
                trig = ",c",
                dscr = "Code Block",
                regTrig = false,
                wordTrig = false,
                priority = 1000,
                snippetType =
                "autosnippet",
            },
            fmta(
                [[
                ```<>
                <>
                ```
               ]],
                { i(1), i(2) }
            )
        )
    )
    table.insert(snippets,
        s(
            {
                trig = ",m",
                dscr = "Mark",
                regTrig = false,
                wordTrig = false,
                priority = 1000,
                snippetType = "autosnippet",
            },
            { t("- [ ] "), }
        )
    )

    table.insert(snippets,
        s(
            {
                trig = ",p",
                dscr = "Picture",
                regTrig = false,
                wordTrig = false,
                priority = 1000,
                snippetType = "autosnippet",
            },
            fmta(
                [[![<>](<>)]],
                { i(1, "display name"), i(2, "link") }
            )
        )
    )

    return snippets
end

ls.add_snippets("all", create_snippets_for_markdown())
