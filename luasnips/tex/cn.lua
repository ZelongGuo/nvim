local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Chinese Support
return {
    -- A template
    --
    s({ trig = "cn_template" },
        -- Fonts, check PostScrip Name of the font book on your mac
        -- PostScrip Name: Baoli SC, Hei, Kai, Libian Sc, STFangsong, STKaiti, STSong
        fmta([[
             % !TEX program = XeLaTeX
             % !TEX encoding = UTF-8
             \documentclass{report}
             \usepackage[UTF8]{ctex}

             % ------------- Font Settings -------------
             % default use ctex defaults, uncomment to use your owns
             % \setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STKaiti}
             % \setCJKsansfont[BoldFont=STHeiti]{STLibianSC-Regular}
             % \setCJKmonofont{STFangsong}

             % ------------- Line Separations -------------
             \linespread{1.0}           % Single line separation
             \setlength{\parskip}{1pt}   % Paragraph separation
             \setlength{\parindent}{2em} % indent for first line in a new Paragraph

             \begin{document}
             <>
             \end{document}
             ]], { i(1) }
        )
    ),
    -- A shebang-like comment for Chinese
    s(
        { trig = 'cn_shebang' },
        {
            t("% ! TeX program = XeLaTEX"),
            t({ "", "% !TEX encoding = UTF-8" })
        }
    ),

    -- ctex package
    s(
        { trig = 'ctex' },
        { t("\\usepackage[UTF8]{ctex}") }
    )

}
