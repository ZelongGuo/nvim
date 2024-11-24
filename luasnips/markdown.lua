local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
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


local function create_snippets_for_markdown()
    local snippets = {}

    -- Helper function to define a snippet
    local function define_snippet(trig, dscr, nodes, opts)
        opts = opts or {}
        opts.trig = trig
        opts.dscr = dscr
        opts.regTrig = opts.regTrig or false
        opts.wordTrig = opts.wordTrig or false
        opts.priority = opts.priority or 1000
        opts.snippetType = opts.snippetType or "autosnippet" -- snippet or autosnippet
        table.insert(snippets, s(opts, nodes))
    end

    --------------------------------------- Pairs -------------------------------------------------
    local pairs = {
        {
            trig = ",i",
            dscr = "Italic",
            nodes = fmta([[*<>*]], { d(1, get_visual) }),
            opts = { wordTrig = false, priority = 1000 }
        },
        {
            trig = ",b",
            dscr = "Bold",
            nodes = fmta([[**<>**]], { d(1, get_visual) })
        },
        {
            trig = ",d",
            dscr = "Delete Line",
            nodes = fmta([[~~<>~~]], { d(1, get_visual) })
        },
        {
            trig = ",q",
            dscr = "Quotation",
            nodes = fmta([[`<>`]], { d(1, get_visual) })
        }
    }

    for _, pair in ipairs(pairs) do
        define_snippet(pair.trig, pair.dscr, pair.nodes, pair.opts)
    end

    --------------------------------------- Others -------------------------------------------------
    local other_snippets = {
        {
            trig = ",c",
            dscr = "Code Block or Color Text, choice nodes",
            nodes = c(1, {
                fmt(
                    [[
                    ```<>
                    <>
                    ```
                    ]],
                    { i(1), i(2) },
                    { delimiters = "<>" }
                ),
                fmta(
                    [[<font size="{}"  color="{}">{}</font>]],
                    { i(1, "3"), i(2, "red"), i(3) },
                    { delimiters = "{}" }
                )
            })
        },
        {
            trig = ",m",
            dscr = "Mark",
            nodes = { t("- [ ] ") },
        },
        {
            trig = ",p",
            dscr = "Insert Picture, choice nodes",
            nodes = c(1, {
                fmt(
                    [[![<>](<>)]],
                    { i(1, "display name"), i(2, "link") },
                    { delimiters = "<>" }
                ),
                fmt(
                    [[
                    <center>
                    <img style="border-radius: 0.2125em;" src="../img/{}" width="{}%" height="auto">
                    <div style="
                    display: outline;
                    font-style: italic;
                    color: #666;
                    padding: 2px;">Figure {} </div>
                    </center>
                    ]],
                    {
                        i(1, "image-name"),
                        i(2, "width"),
                        i(3, "caption"),
                    },
                    { delimiters = "{}" }
                )
            })
        },
        {
            trig = ",a",
            dscr = "Link",
            nodes = fmta(
                [[[<>](<>)]],
                { i(1, "display name"), i(2, "link") }
            ),
        },
    }

    for _, snippet in ipairs(other_snippets) do
        define_snippet(snippet.trig, snippet.dscr, snippet.nodes, snippet.opts)
    end

    return snippets
end

ls.add_snippets("all", create_snippets_for_markdown())
