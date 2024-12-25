local helper = require("utils.luasnip-helper-funcs")
local get_visual = helper.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-------------------------------------------------------
--  | Keyword | Matched characters                  |
--  |   .     | all characters                      |
--  |   %d    | digits                              |
--  |   %a    | letters (uppercase and lowercase)   |
--  |   %w    | alphanumeric characters             |
--  |   %l    | lowercase letters                   |
--  |   %s    | white space characters              |
-------------------------------------------------------

return {
    ----------------------------------------------------
    --- Math environment
    ----------------------------------------------------
    -- Math inline, after non-lower-case
    s({ trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>$<>$<>",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
                i(2),
            }
        )
    ),

    -- Math outline
    s({ trig = "MM", snippetType = "autosnippet" },
        c(1, {
            -- With equation number
            fmta(
                [[
                \begin{equation}
                    <>
                    % \label{eq:}
                \end{equation}
                ]],
                { i(1) }
            ),
            -- Without equation number
            fmta(
                [[
                \begin{equation*}
                    <>
                \end{equation*}
                ]],
                { i(1) }
            ),
            fmta(
                [[
                $$
                <>
                $$
                ]],
                { i(1) }
            ),
        }), { condition = line_begin }
    ),
    -- Equation aligned
    s({ trig = "al", wordTrig = true, snippetType = "autosnippet" },
        fmta([[
             \begin{aligned}
                 <>
             \end{aligned}
             ]], { d(1, get_visual) }),{ condition = line_begin }
    ),
    -- Equation left {
    s({ trig = "l{", wordTrig = true, snippetType = "autosnippet" },
        fmta([[
             \left\{
             \begin{aligned}
                 <>
             \end{aligned}
             \right.
             ]], { d(1, get_visual) }),{ condition = line_begin }
    ),
    -- Equation right {
    s({ trig = "r{", wordTrig = true, snippetType = "autosnippet" },
        fmta([[
             \left.
             \begin{aligned}
                 <>
             \end{aligned}
             \right\}
             ]], { d(1, get_visual) }),{ condition = line_begin }
    ),


    ----------------------------------------------------
    --- Matrix
    ----------------------------------------------------
    s({ trig = "m(", wordTrig = true, snippetType = "autosnippet" },  -- require <amsmath>
        fmta([[
             \begin{pmatrix}
                <> & <> \\
                <>
             \end{pmatrix}
             ]], { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "m[", wordTrig = true, snippetType = "autosnippet" },  -- require <amsmath>
        fmta([[
             \begin{bmatrix}
                <> & <> \\
                <>
             \end{bmatrix}
             ]], { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "m{", wordTrig = true, snippetType = "autosnippet" },  -- require <amsmath>
        fmta([[
             \begin{Bmatrix}
                <> & <> \\
                <>
             \end{Bmatrix}
             ]], { i(1), i(2), i(3) }
        )
    ),
    s({ trig = "m|", wordTrig = true, snippetType = "autosnippet" },  -- require <amsmath>
        fmta([[
             \begin{vmatrix}
                <> & <> \\
                <>
             \end{vmatrix}
             ]], { i(1), i(2), i(3) }
        )
    ),

    ----------------------------------------------------
    --- Operations
    ----------------------------------------------------
    -- & =
    s({ trig = "==", dscr = "&=", snippetType = "autosnippet" }, { t("&=") },
      { condition = tex.in_mathzone }),
    -- Fraction
    s({ trig = "([^%a])fr", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\frac{<>}{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
                i(2),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Square root
    s({ trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sqrt{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Logarithm with base subscript
    s({ trig = "([^%a%\\])lo", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\log_{<>}{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2)
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Sum with lower limit
    s({ trig = "([^%a])Su", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sum_{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Sum with upper and lower limit
    s({ trig = "([^%a])su", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\sum_{<>}^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Integral with upper and lower limit
    s({ trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\int_{<>}^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2),
            }
        ), { condition = tex.in_mathzone }
    ),
    -- Integral from positive to negative infinity
    s({ trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\int_{\\infty}^{\\infty}",
            {
                f(function(_, snip) return snip.captures[1] end),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Integral without limit
    s({ trig = "in1", dscr = "∫", snippetType = "autosnippet" }, { t("\\int") },
      { condition = tex.in_mathzone }),
    s({ trig = "in2", dscr = "∬", snippetType = "autosnippet" }, { t("\\iint") },
      { condition = tex.in_mathzone }),
    s({ trig = "in3", dscr = "∭", snippetType = "autosnippet" }, { t("\\iiint") },
      { condition = tex.in_mathzone }),
    s({ trig = "oi1", dscr = "∮", snippetType = "autosnippet" }, { t("\\oint") },
      { condition = tex.in_mathzone }),
    s({ trig = "oi2", dscr = "∯", snippetType = "autosnippet" }, { t("\\oiint") },
      { condition = tex.in_mathzone }),

    -- Basic Operations and sysmbols
    s({ trig = "cd", dscr = "⋅", snippetType = "autosnippet" }, { t("\\cdot ") },
      { condition = tex.in_mathzone }),
    s({ trig = "xx", dscr = "×", snippetType = "autosnippet" }, { t("\\times ") },
      { condition = tex.in_mathzone }),
    s({ trig = "di", dscr = "÷", snippetType = "autosnippet" }, { t("\\div "), },
      { condition = tex.in_mathzone }),
    s({ trig = "ap", dscr = "≈", snippetType = "autosnippet" }, { t("\\approx ") },
      { condition = tex.in_mathzone }),
    s({ trig = "~=", dscr = "≈", snippetType = "autosnippet" }, { t("\\approx ") },
      { condition = tex.in_mathzone }),
    s({ trig = "!=", dscr = "≠", snippetType = "autosnippet" }, { t("\\neq ") },
      { condition = tex.in_mathzone }),
    s({ trig = "ne", dscr = "≠", snippetType = "autosnippet" }, { t("\\neq ") },
      { condition = tex.in_mathzone }),
    s({ trig = "pt", dscr = "∝", snippetType = "autosnippet" }, { t("\\propto ") },
      { condition = tex.in_mathzone }),
    s({ trig = "la", dscr = "⇐", snippetType = "autosnippet" }, { t("\\Leftarrow ") },
      { condition = tex.in_mathzone }),
    s({ trig = "ra", dscr = "⇒", snippetType = "autosnippet" }, { t("\\Rightarrow ") },
      { condition = tex.in_mathzone }),
    s({ trig = "ci", dscr = "∘", snippetType = "autosnippet" }, { t("\\circ") },
      { condition = tex.in_mathzone }),
    s({ trig = "<=", dscr = "⩽", snippetType = "autosnippet" }, { t("\\leqslant ") },
      { condition = tex.in_mathzone }),
    s({ trig = ">=", dscr = "⩾", snippetType = "autosnippet" }, { t("\\geqslant ") },
      { condition = tex.in_mathzone }),
    s({ trig = "be", dscr = "∵", snippetType = "autosnippet" }, { t("\\because ") },
      { condition = tex.in_mathzone }),
    s({ trig = "so", dscr = "∴", snippetType = "autosnippet" }, { t("\\therefore ") },
      { condition = tex.in_mathzone }),

    -- Derivatives
    s({ trig = "([^%a])dd", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\frac{\\mathrm{d} {<>}}{\\mathrm{d} {<>}}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1), i(2)
            }
        ), { condition = tex.in_mathzone }
    ),

    s({ trig = "([^%a])pd", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta(
            "<>\\frac{\\partial {<>}}{\\partial {<>}}",
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1), i(2)
            }
        ), { condition = tex.in_mathzone }
    ),

    ----------------------------------------------------
    --- Superscript, subscript and related stuff
    ----------------------------------------------------
    -- Superscript, '
    s({ trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta([[<>^{<>}]], { f(function(_, snip) return snip.captures[1] end), d(1, get_visual) }),
        { condition = tex.in_mathzone }),

    -- Superscript shortcut, *"*
    s({ trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                f(function(_, snip) return snip.captures[2] end),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Subscript, ;
    s({ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta([[<>_{<>}]], { f(function(_, snip) return snip.captures[1] end), d(1, get_visual) }),
        { condition = tex.in_mathzone }),

    -- Subscript shortcut, :
    s({ trig = '([%w%)%]%}]):([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>_{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                f(function(_, snip) return snip.captures[2] end),
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Subscript and superscript, __
    s({ trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta([[<>^{<>}_{<>}]], { f(function(_, snip) return snip.captures[1] end), i(1), i(2) }),
        { condition = tex.in_mathzone }
    ),

    -- Text subscript, ts
    s({ trig = 'ts', snippetType = "autosnippet", wordTrig = false },
        fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
        { condition = tex.in_mathzone }
    ),

    ----------------------------------------------------
    --- Specitial superscript, subscript
    ----------------------------------------------------
    -- Zero subscript shortcut
    s({ trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>_{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                t("0")
            }
        ), { condition = tex.in_mathzone }
    ),
    -- One superscript shortcut
    s({ trig = '([%a%)%]%}])11', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta("<>_{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                t("1")
            }
        ), { condition = tex.in_mathzone }
    ),

    -- Some superscripts, like bar, vec etc.
    -- Vector, i.e. \vec
    s({ trig = "([^%a])ve", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\vec{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),

    s({ trig = "([^%a])ba", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\bar{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),

    s({ trig = "([^%a])ha", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\hat{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),

    s({ trig = "([^%a])do", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\dot{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),

    s({ trig = "([^%a])ti", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\tilde{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        ), { condition = tex.in_mathzone }
    ),


    -- -- J subscript shortcut (since jk triggers snippet jump forward)
    -- s({ trig = '([%a%)%]%}])JJ', wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta( "<>_{<>}", { f(function(_, snip) return snip.captures[1] end), t("j") }),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Conjugate (star) superscript shortcut
    -- s({ trig = '([%a%)%]%}])%*%*', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    --     fmta( "<>^{<>}", { f(function(_, snip) return snip.captures[1] end), t("*") }),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Plus superscript shortcut
    -- s({ trig = '([%a%)%]%}])%+%+', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    --     fmta( "<>^{<>}",  { f(function(_, snip) return snip.captures[1] end), t("+") }),
    --     { condition = tex.in_mathzone }),

    -- -- Complement superscript
    -- s({ trig = '([%a%)%]%}])CC', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    --     fmta( "<>^{<>}", { f(function(_, snip) return snip.captures[1] end), t("\\complement")}),
    --     { condition = tex.in_mathzone }
    -- ),

    ----------------------------------------------------
    --- Functions used often
    ----------------------------------------------------
    -- Exponentials subscript shortcut
    -- s({ trig = '([^%a])ee', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    --     fmta(
    --         "<>e^{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual)
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),
    s({ trig = "exp", wordTrig = true, snippetType = "autosnippet" },
        { t("e^{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "ln", wordTrig = true, snippetType = "autosnippet" },
        { t("\\ln{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "sin", wordTrig = true, snippetType = "autosnippet" },
        { t("\\sin{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "cos", wordTrig = true, snippetType = "autosnippet" },
        { t("\\cos{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "tan", wordTrig = true, snippetType = "autosnippet" },
        { t("\\tan{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "cot", wordTrig = true, snippetType = "autosnippet" },
        { t("\\cot{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "sec", wordTrig = true, snippetType = "autosnippet" },
        { t("\\sec{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),
    s({ trig = "csc", wordTrig = true, snippetType = "autosnippet" },
        { t("\\csc{"), d(1, get_visual), t("}") }, { condition = tex.in_mathzone }),

    ----------------------------------------------------
    --- Other stuff
    ----------------------------------------------------
    -- Boxed command
    s({ trig = "([^%a])bo", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
        fmta("<>\\boxed{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual)
            }
        ), { condition = tex.in_mathzone }
    ),

    -- -- Default unit vector with subscript, i.e. \unitvector_{}
    -- s({ trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\unitvector_{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),
    -- -- Unit vector with hat, i.e. \uvec{}
    -- s({ trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\uvec{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Matrix, i.e. \vec
    -- s({ trig = "([^%a])mt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\mat{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Angle
    -- s({ trig = "([^%a])gg", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\ang{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Absolute value
    -- s({ trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\abs{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Binomial symbol
    -- s({ trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\binom{<>}{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             i(1),
    --             i(2),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- \newcommand{\diff}{\ensuremath{\operatorname{d}\!}}
    -- \renewcommand{\dv}[2]{\frac{\mathrm{d} #1}{\mathrm{d} #2}}
    -- \newcommand{\dvOne}[1]{\frac{\mathrm{d}}{\mathrm{d} #1}}
    -- \newcommand{\dvN}[3]{\frac{\mathrm{d}^{#1} #2}{\mathrm{d} #3^{#1}}}
    -- \renewcommand{\pdv}[2]{\frac{\partial #1}{\partial #2}}
    -- \newcommand{\pdvOne}[1]{\frac{\partial}{\partial #1}}
    -- \newcommand{\pdvN}[3]{\frac{\partial^{#1} #2}{\partial #3^{#1}}}
    -- \newcommand{\pdvThree}[3]{\frac{\partial^{2} #1}{\partial #2 \partia


    -- -- Derivative with numerator and denominator
    -- s({ trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\dv{<>}{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             i(1),
    --             i(2)
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Derivative with numerator, denominator, and higher-order argument
    -- s({ trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\dvN{<>}{<>}{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             i(1),
    --             i(2),
    --             i(3),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),


    -- -- Partial derivative with denominator only
    -- s({ trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\pdvOne{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             d(1, get_visual),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Partial derivative with numerator and denominator
    -- s({ trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\pdv{<>}{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             i(1),
    --             i(2)
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    -- -- Partial derivative with numerator, denominator, and higher-order argument
    -- s({ trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    --     fmta(
    --         "<>\\pdvN{<>}{<>}{<>}",
    --         {
    --             f(function(_, snip) return snip.captures[1] end),
    --             i(1),
    --             i(2),
    --             i(3),
    --         }
    --     ),
    --     { condition = tex.in_mathzone }
    -- ),

    --
    -- BEGIN STATIC SNIPPETS
    --

    -- Differential, i.e. \diff
    -- s({ trig = "df", snippetType = "autosnippet" }, { t("\\diff") }, { condition = tex.in_mathzone }),
    -- -- Parallel symbol, i.e. ∥
    -- s({ trig = "||", snippetType = "autosnippet" }, { t("\\parallel") }),
    -- -- Cdots, i.e. ⋯
    -- s({ trig = "cdd", snippetType = "autosnippet" }, { t("\\cdots") }),
    -- -- Ldots, i.e. …
    -- s({ trig = "ldd", snippetType = "autosnippet" }, { t("\\ldots") }),
    -- -- Equiv, i.e. ≡
    -- s({ trig = "eqq", snippetType = "autosnippet" }, { t("\\equiv ") }),
    -- -- Setminus, i.e. ⧵Math environment
    -- s({ trig = "stm", snippetType = "autosnippet" }, { t("\\setminus ") }),
    -- -- Subset, i.e. \subset ⊂
    -- s({ trig = "sbb", snippetType = "autosnippet" }, { t("\\subset ") }),
    -- -- Colon, i.e. \colon :
    -- s({ trig = "::", snippetType = "autosnippet" }, { t("\\colon ") }),
    -- -- Dot product, i.e. \cdot ⋅

    -- -- Gradient operator, i.e. \grad
    -- s({ trig = "gdd", snippetType = "autosnippet" }, { t("\\grad ") }, { condition = tex.in_mathzone }),
    -- -- Curl operator, i.e. \curl
    -- s({ trig = "cll", snippetType = "autosnippet" }, { t("\\curl ") }, { condition = tex.in_mathzone }),
    -- -- Laplacian operator, i.e. \laplacian
    -- s({ trig = "laa", snippetType = "autosnippet" }, { t("\\laplacian ") }, { condition = tex.in_mathzone }),
}
