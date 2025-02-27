local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- Body template
    s(
        { trig = "template" },
        fmta(
            [[
            % !TeX program = xelatex
            % !TEX encoding = UTF-8
            % A shebang-like comment for Chinese

            \documentclass{article} % article, report, book, letter, beamer, etc

            % -----------------------------------------------------------------------------
            % Preambles
            \usepackage[UTF8, scheme=plain]{ctex}    % Chinese Support, Pure English
            \usepackage{geometry}                    % Page Layout
            \usepackage{xcolor}                      % Xcolor is Required for Show Color
            \usepackage{tcolorbox}                   % Color Box for Notes
            \usepackage[normalem]{ulem}              % delete line, wave line etc
            \usepackage{enumitem}                    % customize itemize and enumerate
            \usepackage{listings}                    % codes
            \usepackage{graphicx}                    % figures
            \usepackage{amsmath}                     % equation
            \usepackage{amssymb}                     % some AMS math symbols
            \usepackage{hyperref}                    % links, put this package last avoiding possible conflicts
            \usepackage{fancyhdr}                    % foot and head for book

            % -----------------------------------------------------------------------
            % Set fonts for English and Chinese
            \setmainfont{Times}  % or: Times New Roman, Arial ... 
            \setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STKaiti}

            % -----------------------------------------------------------------------
            % Setting Page Layout
            \geometry{a4paper,scale=0.8}
            \pagestyle{fancy}
            % Setting Line and Paragraph Spacing
            \linespread{1.1} % 1.1 line Spacing 
            \setlength{\parskip}{1pt}   % Paragraph Spacing
            \setlength{\parindent}{2em} % Paragraph Indentation

            % -----------------------------------------------------------------------
            % Define Colors
            \definecolor{codegreen}{rgb}{0,0.6,0}
            \definecolor{codegray}{rgb}{0.5,0.5,0.5}
            \definecolor{codepurple}{rgb}{0.58,0,0.82}
            \definecolor{backcolour}{rgb}{0.95,0.95,0.92}

            % -----------------------------------------------------------------------
            % Code Block Style
            \lstdefinestyle{mystyle}{
                backgroundcolor=\color{backcolour},
                commentstyle= \color{red!50!green!50!blue!50},  % comments color
                keywordstyle= \color{blue!70},  % keywords color
                numberstyle=\tiny\color{codegray},  % color of the row number on left side
                stringstyle=\color{codepurple},
                basicstyle=\ttfamily\footnotesize,
                breakatwhitespace=false,
                breaklines=true,  % automatic wrap for long codes
                captionpos=b,
                keepspaces=true,
                numbers=left,  % show row numbers
                numbersep=5pt,
                showspaces=false,
                showstringspaces=false,  % do not show the white space of the string
                showtabs=false,
                tabsize=2,
                frame=single  % [none | single | shadowbox], show box
            }
            \lstset{style=mystyle}  % use listings style

            % -----------------------------------------------------------------------
            % Set Itemize and Enumerate Style
            % Dynamically adjusting with font size and type
            \setlist[itemize]{itemsep=0.5ex, parsep = 0ex, topsep=0.8ex}
            \setlist[enumerate]{itemsep=0.5ex, parsep = 0ex, topsep=0.8ex}

            % -----------------------------------------------------------------------
            % Set Hyperlink Style
            \hypersetup{
                colorlinks=true,
                linkcolor=blue,             % internal links, e.g., content
                filecolor=magenta,          % local files
                urlcolor=cyan,              % website links
                pdftitle={Overleaf Example},
                pdfpagemode=FullScreen,
                }

            % -----------------------------------------------------------------------
            % Title & Author 
            \title{\huge{\textbf{<>}}}
            \author{
                \Large{Zelong Guo\footnote{Personal Website: \href{https://zelongguo.github.io/}{https://zelongguo.github.io/}}} \\
                \\
                Section 1.4 Remote Sensing and Geoinformatics \\
                GFZ German Research Center of Geosciences, Potadam, Germany \\
                E-mail: zelong@gfz.de\thanks{E-mail also: zelong.guo@outlook.com} \\ 
                % First Create: 2024.12.06
            }
            \date{\today}
            % -----------------------------------------------------------------------------

            % -----------------------------------------------------------------------------
            \begin{document}

            \maketitle
            % \tableofcontents
            % \newpage

            % -----------------------------------------------------------------------------
            % \input{./chapters/1.tex} 
            % \input{./chapters/2.tex} 
            % -----------------------------------------------------------------------------

            % \chapter{Introduction}
            \section{Background}
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




