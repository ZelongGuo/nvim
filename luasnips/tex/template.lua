local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- Body template
    -- Fonts, check PostScrip Name of the font book on your mac
    -- PostScrip Name: Baoli SC, Hei, Kai, Libian Sc, STFangsong, STKaiti, STSong
    s(
        { trig = "latex_main" },
        fmta(
            [[
            % !TeX program = xelatex
            % !TEX encoding = UTF-8
            % Default support Chinese

            \documentclass{article}  % OR Customize Class: myarticle, myreport, mybook

            % -----------------------------------------------------------------------------
            % Defualt User Information
            \title{\huge{\textbf{<>}}}
            \author{
                \Large{Zelong Guo\footnote{Personal Website: \href{https://zelongguo.github.io/}{https://zelongguo.github.io/}}} \\
                \\
                Section 1.4 Remote Sensing and Geoinformatics \\
                GFZ German Research Center of Geosciences, Potadam, Germany \\
                E-mail: zelong@gfz.de\thanks{E-mail also: zelong.guo@outlook.com} \\ 
            }
            \date{\today}

            % -----------------------------------------------------------------------------
            \begin{document}
            \maketitle
            % \tableofcontents
            % \newpage

            % -----------------------------------------------------------------------------
            % -- If you have many chapters, you can use the following command to include them
            % \input{./chapters/1.tex}
            % \input{./chapters/2.tex}
            % \input{./chapters/3.tex}
            % -----------------------------------------------------------------------------

            \chapter{Introduction}
            <>

            \end{document}

            ]],
            {
                i(1, "Title Goes Here"),
                i(2, "Body text goes here ...")
            }
        ),
        { condition = line_begin }
    )
}



