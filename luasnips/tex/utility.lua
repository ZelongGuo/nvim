----------------------------------------------------
--- Some very useful snippets for:
--- Headings, Pages
--- Fonts, Codes, Figures, Links and other stuff
----------------------------------------------------

local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function line_begin_or_non_letter(line_to_cursor, matched_trigger)
    local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
    local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[^%a]")
    return line_begin or non_letter
end

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = function(line_to_cursor, matched_trigger)
    -- +1 because `string.sub("abcd", 1, -2)` -> abc
    return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
end
----------------------------------------------------------------------------------------------------
return {
    ---------------------------------------------------------
    --- Headings, Sections, Fonts, Codes, Links and Pictures
    ---------------------------------------------------------
    --- Headings, Sections
    s({ trig = "h0", wordTrig = true, snippetType = "autosnippet"}, -- Chapter, report and book only
        fmta([[\chapter{<>}]], { d(1, get_visual) })),
    s({ trig = "h1", wordTrig = true, snippetType = "autosnippet"}, -- Section
        fmta([[\section{<>}]], { d(1, get_visual) })),
    s({ trig = "h2", wordTrig = true, snippetType = "autosnippet"}, -- SubSection
        fmta([[\subsection{<>}]], { d(1, get_visual) })),
    s({ trig = "h3", wordTrig = true, snippetType = "autosnippet"}, -- SubSubSection
        fmta([[\subsubsection{<>}]], { d(1, get_visual) })),
    ----------------------------------------------------
    --- Horizontal and vertical space
    s({trig="hs", wordTrig = true, snippetType="autosnippet"},      -- hspace
        fmta([[\hspace{<>em}]], { i(1, "1") })),
    s({trig="vs", wordTrig = true, snippetType="autosnippet"},      -- vspace
        fmta([[\vspace{<>ex}]], { i(1, "1") }), { condition = line_begin }),
    ----------------------------------------------------
    --- Fonts
    s({trig = ",l", dscr = "large text",      snippetType = "autosnippet"}, -- large
        fmta("{\\large{<>}}", { d(1, get_visual) })),
    s({trig = ",L", dscr = "Large text",      snippetType = "autosnippet"}, -- Large
        fmta("{\\Large{<>}}", { d(1, get_visual) })),
    s({trig = ",h", dscr = "huge text",       snippetType = "autosnippet"}, -- huge
        fmta("{\\huge{<>}}",  { d(1, get_visual) })),
    s({trig = ",H", dscr = "huge text",       snippetType = "autosnippet"}, -- Huge
        fmta("{\\Huge{<>}}",  { d(1, get_visual) })),
    s({trig = ",t", dscr = "Typewriter text", snippetType = "autosnippet"}, -- Typewriter
        fmta("\\texttt{<>}",  { d(1, get_visual) })),
    s({trig = ",T", dscr = "Typewriter text", snippetType = "autosnippet"}, -- Normal text in equation
        fmta("\\textrm{<>}",  { d(1, get_visual) }), { condition = tex.in_mathzone} ),
    s({trig = ",i", dscr = "Italic text",     snippetType = "autosnippet"}, -- Italic
        fmta("\\textit{<>}",  { d(1, get_visual) })),
    s({ trig = ",b", dscr = "Bold text",      snippetType = "autosnippet"}, -- Bold
        fmta("\\textbf{<>}", { d(1, get_visual) })),
    s({ trig = ",c", dscr = "Color text",     snippetType = "autosnippet"}, -- Color text
        fmta("\\textcolor{<>!100}{<>}", { i(2, "red"), d(1, get_visual) })),
    s({ trig = ",d", dscr = "delete line", snippetType = "autosnippet"}, -- Delete, require <ulem>
        fmta("\\sout{<>}", { d(1, get_visual) })),
    s({ trig = ",u", dscr = "Under line", snippetType = "autosnippet"},  -- Underscore, require <ulem>
        fmta("\\uline{<>}", { d(1, get_visual) })),
    s({ trig = ",U", dscr = "Under line", snippetType = "autosnippet"},  -- Underwave, require <ulem>
        fmta("\\uwave{<>}", { d(1, get_visual) })),
    s({ trig = ",f", dscr = "Facecolor text", priority = 2000, snippetType = "autosnippet"}, -- Background text
        fmta("\\colorbox{green!30}{<>}", { d(1, get_visual) })),
    s( { trig = ",B", dscr = "Box with color", priority = 2000, snippetType = "autosnippet"}, -- Color box, require <tcolorbox>
        fmta(
            [[
            \begin{tcolorbox}[colback=<>!5, colframe=<>!70!black, title=<>]
                <>
            \end{tcolorbox}
            ]],
            {
                i(1, "red"),
                d(2,
                    function(args)
                        return sn(nil, {
                          -- jump-indices are local to each snippetNode, so restart at 1.
                          i(1, args[1])})
                    end,
                    { 1 }
                ),
                i(3, "Important Note"),
                i(4)
            }
        )
    ),

    ----------------------------------------------------
    --- Codes
    s({ trig = ",C", snippetType = "autosnippet" },     -- Code block, require <listings>
        fmta([[
             \begin{lstlisting}[language=<>]
                <>
             \end{lstlisting}
             ]], { i(1, "python"), i(2) })
    ),
    ----------------------------------------------------
    --- Pictures
    s({ trig = ",p", snippetType = "autosnippet" },     -- Pictures, require <graphicx>
        fmta([[
             \begin{figure}[htbp]
                 \centering
                 \includegraphics[width=<>\linewidth]{<>}
                 \caption{<>}
                 \label{fig:<>}
             \end{figure}
             ]], { i(1, "0.8"), i(2, "FigPath"), i(3), i(4) }
        ), { condition = line_begin }
    ),
    ----------------------------------------------------
    --- Links
    s({ trig = ",a", snippetType = "autosnippet" },     -- Link, require <hyperref>
        fmta([[
             \href{<>}{<>}
        ]], { i(1, "link"), i(2, "display name") })
    ),

    ---------------------------------------------------------
    --- Refereces, Item
    ---------------------------------------------------------
    s({ trig = ",r", snippetType = "autosnippet" },     -- Link, require <hyperref>
        fmta([[
             \ref{<>:<>}
        ]], { i(1, "fig"), i(2, "label") })
    ),

    s({ trig = ",I", snippetType = "autosnippet" },     -- Items, require <enumitem>
        fmta([[
             \begin{itemize}
                 \item <>
             \end{itemize}
        ]], { d(1, get_visual)}), { condition = line_begin }
    ),

    s({ trig = "tab" },     -- Table
        fmta([[
             \begin{tabular}{<>}
             \hline
             <> & <> & <> \\
             \hline
             <> & <> & <> \\
             \hline
             \end{tabular}
             ]],
            { i(1,"ccc"), i(2,"Head"), i(3,"Head"), i(4,"Head"), i(5,"item"), i(6,"item"), i(7,"item")}
        )
    ),

    -- \footnote{⟨footnote⟩}

    -- -- Itersize
    -- s("item", {
    --     t({"\\begin{itemize}",
    --     "\t\\item "}), i(1), d(2, rec_item, {}),
    --     t({"", "\\end{itemize}"}), i(0)
    -- }),

--     s("table1", {
-- 	t"\\begin{tabular}{",
-- 	i(1,"0"),
-- 	t{"}",""},
-- 	d(2, table_node, {1}, {}),
-- 	d(3, rec_table, {1}),
-- 	t{"","\\end{tabular}"}
-- }),
    ----------------------------------------------------------------------------------------------------
    -- MATH ROMAN i.e. \mathrm
    s({ trig = "([^%a])rmm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>\\mathrm{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),
    -- MATH CALIGRAPHY i.e. \mathcal
    s({ trig = "([^%a])mcc", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>\\mathcal{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),
    -- MATH BOLDFACE i.e. \mathbf
    s({ trig = "([^%a])mbf", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>\\mathbf{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),
    -- MATH BLACKBOARD i.e. \mathbb
    s({ trig = "([^%a])mbb", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>\\mathbb{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),
    -- REGULAR TEXT i.e. \text (in math environments)
    s({ trig = "([^%a])tee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>\\text{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),
}
