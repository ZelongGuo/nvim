local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return
{
    -- GENERIC ENVIRONMENT
    s({ trig = "new", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{<>}
            <>
        \end{<>}
      ]],
            {
                i(1),
                d(2, get_visual),
                rep(1),
            }
        ),
        { condition = line_begin }
    ),
    -- ENVIRONMENT WITH ONE EXTRA ARGUMENT
    s({ trig = "n2", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{<>}{<>}
            <>
        \end{<>}
      ]],
            {
                i(1),
                i(2),
                d(3, get_visual),
                rep(1),
            }
        ),
        { condition = line_begin }
    ),
    -- ENVIRONMENT WITH TWO EXTRA ARGUMENTS
    s({ trig = "n3", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{<>}{<>}{<>}
            <>
        \end{<>}
      ]],
            {
                i(1),
                i(2),
                i(3),
                d(4, get_visual),
                rep(1),
            }
        ),
        { condition = line_begin }
    ),
    -- TOPIC ENVIRONMENT (my custom tcbtheorem environment)
    s({ trig = "nt", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{topic}{<>}{<>}
            <>
        \end{topic}
      ]],
            {
                i(1),
                i(2),
                d(3, get_visual),
            }
        ),
        { condition = line_begin }
    ),
    -- EQUATION
    s({ trig = "nn", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    -- SPLIT EQUATION
    s({ trig = "ss", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{equation*}
            \begin{split}
                <>
            \end{split}
        \end{equation*}
      ]],
            {
                d(1, get_visual),
            }
        ),
        { condition = line_begin }
    ),
    -- ALIGN
    s({ trig = "all", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{align*}
            <>
        \end{align*}
      ]],
            {
                i(1),
            }
        ),
        { condition = line_begin }
    ),
    -- ITEMIZE
    s({ trig = "itt", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{itemize}

            \item <>

        \end{itemize}
      ]],
            {
                i(0),
            }
        ),
        { condition = line_begin }
    ),
    -- ENUMERATE
    s({ trig = "enn", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{enumerate}

            \item <>

        \end{enumerate}
      ]],
            {
                i(0),
            }
        )
    ),
    -- INLINE MATH
    s({ trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>$<>$",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),
    -- INLINE MATH ON NEW LINE
    s({ trig = "^mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "$<>$",
            {
                i(1),
            })),
    -- FIGURE
    s({ trig = "fig" },
        fmta(
            [[
        \begin{figure}[htbp]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        ]],
            {
                i(1),
                i(2),
                i(3),
                i(4),
            }
        ),
        { condition = line_begin }
    ),
}

-- return {
-- }

--     "body": [

--         "%----------------------------- Define Article ----------------------------------",
--         "\\documentclass{article}",
--         "-------------------------------------------------------------------------------",
--         "",
--         "----------------------------- Using Packages ----------------------------------",
--         "\\usepackage{geometry}",
--         "\\usepackage{graphicx}",
--         "\\usepackage{amssymb}",
--         "\\usepackage{amsmath}",
--         "\\usepackage{amsthm}",
--         "\\usepackage{empheq}",
--         "\\usepackage{mdframed}",
--         "\\usepackage{booktabs}",
--         "\\usepackage{lipsum}",
--         "\\usepackage{graphicx}",
--         "\\usepackage{color}",
--         "\\usepackage{psfrag}",
--         "\\usepackage{pgfplots}",
--         "\\usepackage{bm}",
--         "-------------------------------------------------------------------------------",
--         "",
--         "${3:% Other Settings}",
--         "",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%% Page Setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "\\geometry{a4paper}",
--         "",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%% Define some useful colors %%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "\\definecolor{ocre}{RGB}{243,102,25}",
--         "\\definecolor{mygray}{RGB}{243,243,244}",
--         "\\definecolor{deepGreen}{RGB}{26,111,0}",
--         "\\definecolor{shallowGreen}{RGB}{235,255,255}",
--         "\\definecolor{deepBlue}{RGB}{61,124,222}",
--         "\\definecolor{shallowBlue}{RGB}{235,249,255}",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%% Define an orangebox command %%%%%%%%%%%%%%%%%%%%%%%%",
--         "\\newcommand\\orangebox[1]{\\fcolorbox{ocre}{mygray}{\\hspace{1em}#1\\hspace{1em}}}",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%% English Environments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "\\newtheoremstyle{mytheoremstyle}{3pt}{3pt}{\\normalfont}{0cm}{\\rmfamily\\bfseries}{}{1em}{{\\color{black}\\thmname{#1}~\\thmnumber{#2}}\\thmnote{\\,--\\,#3}}",
--         "\\newtheoremstyle{myproblemstyle}{3pt}{3pt}{\\normalfont}{0cm}{\\rmfamily\\bfseries}{}{1em}{{\\color{black}\\thmname{#1}~\\thmnumber{#2}}\\thmnote{\\,--\\,#3}}",
--         "\\theoremstyle{mytheoremstyle}",
--         "\\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowGreen,linecolor=deepGreen,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{theorem}{Theorem}[section]",
--         "\\theoremstyle{mytheoremstyle}",
--         "\\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowBlue,linecolor=deepBlue,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{definition}{Definition}[section]",
--         "\\theoremstyle{myproblemstyle}",
--         "\\newmdtheoremenv[linecolor=black,leftmargin=0pt,innerleftmargin=10pt,innerrightmargin=10pt,]{problem}{Problem}[section]",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plotting Settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "\\usepgfplotslibrary{colorbrewer}",
--         "\\pgfplotsset{width=8cm,compat=1.9}",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title & Author %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "\\title{${1:Title}}",
--         "\\author{${2:Haoyun Qin}}",
--         "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
--         "",
--         "\\begin{document}",
--         "    \\maketitle",
--         "    $0",
--         "\\end{document}"
--     ],
--     "description": "Use the default template which includes a variety of packages and declared-commands. The template will also automatically generate the title and author, as well as date, and will formate the document."
-- },
