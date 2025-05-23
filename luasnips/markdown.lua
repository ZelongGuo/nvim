local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

local snippets = {
    --------------------------------------- Pairs -------------------------------------------------
    s({trig = ",i", dscr = "Italic", wordTrig = false, priority = 1000, snippetType = "autosnippet"},
        fmta([[*<>*]], { d(1, get_visual) })),

    s({trig = ",b", dscr = "Bold", wordTrig = false, priority = 1000, snippetType = "autosnippet"},
        fmta([[**<>**]], { d(1, get_visual) })),

    s({ trig = ",d", dscr = "Delete Line", wordTrig = false, priority = 1000, snippetType = "autosnippet"},
        fmta([[~~<>~~]], { d(1, get_visual) })),

    s({ trig = ",q", dscr = "Quatation", wordTrig = false, priority = 1000, snippetType = "autosnippet"},
        fmta([[`<>`]], { d(1, get_visual) })),

    --------------------------------------- Others -------------------------------------------------
    -- Colot text, using choice nodes, now deprecated
    -- s(
    --     {
    --         trig = ",c",
    --         dscr = "Code Block or Color Text, choice nodes",
    --         wordTrig = false,
    --         priority = 1000,
    --         snippetType = "autosnippet"
    --     },
    --     c(1, {
    --         fmt(
    --             [[
    --                 ```<>
    --                 <>
    --                 ```
    --                 ]],
    --             { i(1), i(2) },
    --             { delimiters = "<>" }
    --         ),
    --         fmta(
    --             [[<font size="{}"  color="{}">{}</font>]],
    --             { i(1, "3"), i(2, "red"), i(3) },
    --             { delimiters = "{}" }
    --         )
    --     })
    -- ),

    -- Colot text
    s({trig = ",c", dscr = "Color Text", snippetType = "autosnippet" },
       fmta([[<font size="{}"  color="{}">{}</font>]], { i(1, "3"), i(2, "red"), i(3) }, { delimiters = "{}" })),
    -- Codes
    s({trig = ",C", dscr = "Codes block", snippetType = "autosnippet" },
        fmt(
            [[
            ```<>
            <>
            ```
            ]],
            { i(1), i(2) }, { delimiters = "<>" }
        )
    ),

    -- Mark
    s({trig = ",m", dscr = "mark", wordtrig = false, priority = 1000, snippetType = "autosnippet" }, t("- [ ] ")),

    -- Insert a picture, choice nodes
    s({trig = ",p", dscr = "Insert Picture, choice nodes", wordtrig = false, snippetType = "autosnippet"},
        c(1, {
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
    ),

    -- Insert a link
    s({trig = ",a", dscr = "Link", wordtrig = false, priority = 1000, snippetType = "autosnippet" },
       fmta([[[<>](<>)]], { i(1, "display name"), i(2, "link") })
    )
}

return snippets

-- ls.add_snippets("all", create_snippets_from_pairs())
