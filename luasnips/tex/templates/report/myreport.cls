% This is a Costomized Report Documentclass .cls file
% Zelong Guo, @ GFZ, Potsdam

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreport}[2025/02/27 Custom Report Class]

% -----------------------------------------------------------------------
% Inherit from the Report Documentclass
\LoadClass{report}

% Load Required Packages
\RequirePackage[UTF8, scheme=plain]{ctex}   % Chinese Support, pure English
\RequirePackage{geometry}                   % Page Layout
\RequirePackage{xcolor}                     % Color Support
\RequirePackage{tcolorbox}                  % Color Box
\RequirePackage[normalem]{ulem}             % Delete Line
\RequirePackage{enumitem}                   % Better Iterms
\RequirePackage{listings}                   % Code Block
\RequirePackage{graphicx}                   % Figures
\RequirePackage{amsmath}                    % Mathmatical Formular
\RequirePackage{esint}                      % Mathmatical Formular
\RequirePackage{cancel}                     % Cancle Line for Mathmatical Formular 
\RequirePackage{amssymb}                    % Mathmatical Symbols
\RequirePackage{hyperref}                   % Hyperlink
\RequirePackage{fancyhdr}                   % Page Header and Footer
\RequirePackage{lipsum}                     % Random Text
\RequirePackage{natbib}                     % References
\RequirePackage{tikz}                       % Figure plotting for math equations

% -----------------------------------------------------------------------
% Set fonts for English
\setmainfont{Times}  % or: Times New Roman, Arial ... 

% Allow users difine their own fonts, otherwise useing the following default fonts
\AtBeginDocument{
    \IfFontExistsTF{STKaiti}
    { \setCJKmainfont[BoldFont=STHeiti,ItalicFont=STKaiti]{STKaiti} }
    { \setCJKmainfont{SimSun} } % option: SimSun, KaiTi, FangSong, LiSu, YouYuan, STFangsong, STKaiti, STSong, STXihei, STXingkai, STXinwei
}

% Define a Nerd Fonts Command, using for Symbols
\IfFontExistsTF{Hack Nerd Font}{
    \newfontfamily\nerdfont{Hack Nerd Font}
}

% Setting Fonts Size and Line Spacing
\renewcommand\normalsize{\fontsize{10pt}{15pt}\selectfont} % 11pt body text，16pt Line Spacing
\setlength{\headheight}{15.0pt}  % Set the Head hight otherwise warnings thrown

% -----------------------------------------------------------------------
% Settting Page Layout
\geometry{a4paper, scale=0.8}
\pagestyle{fancy}

% -----------------------------------------------------------------------
% Define Color
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% -----------------------------------------------------------------------
% Code Block Style
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{red!50!green!50!blue!50},    % Comment Color
    keywordstyle=\color{blue!70},                    % Keyword Color
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,  
    captionpos=b,
    keepspaces=true,
    numbers=left,  
    numbersep=5pt,
    frame=single,
    showstringspaces=false
}
\lstset{style=mystyle}

% -----------------------------------------------------------------------
% Define Lua Language for Listings (Matching C/C++ Style)
\lstdefinelanguage{lua}{
  morekeywords={and,break,do,else,elseif,end,false,for,function,if,in,
                local,nil,not,or,repeat,return,then,true,until,while},
  sensitive=true,
  morecomment=[l]{--},                  % Single-line comment: --
  morecomment=[s]{--[[}{]]},            % Multi-line comment: --[[ ... ]]
  morestring=[b]",                      % String with double quotes
  morestring=[b]',                      % String with single quotes
  keywordstyle=\color{blue!70},         % Keywords in blue
  commentstyle=\color{red!50!green!50!blue!50},  % Comments in mixed red-green-blue
  stringstyle=\color{codepurple},       % Strings in purple
  basicstyle=\ttfamily\footnotesize,    % Monospace font for code
  breaklines=true,                      % Enable line wrapping
  keepspaces=true,                      % Preserve spaces
  numbers=left,                         % Show line numbers on the left
  numbersep=5pt,                        % Line number spacing
  frame=single,                         % Add a frame around code blocks
  showstringspaces=false                % Hide spaces in strings
}

% -----------------------------------------------------------------------
% Set Itemize and Enumerate Style
% dynamically adjusting with font size and type
\setlist[itemize]{itemsep=0.5ex, parsep=0ex, topsep=0.8ex}
\setlist[enumerate]{itemsep=0.5ex, parsep=0ex, topsep=0.8ex}

% -----------------------------------------------------------------------
% Set Hyperlink Style
\hypersetup{
    colorlinks=true,
    linkcolor=blue,    % set \ref、\eqref etc
    citecolor=black,   % set \cite
    filecolor=magenta,
    urlcolor=cyan
}

% -----------------------------------------------------------------------
% Set User Costomized Commands
\newcommand{\name}{}
\newcommand{\affiliation}{}
\newcommand{\email}{}
% Redefine Today to avoid outputting Chinese data when using Ctex
\renewcommand{\today}{\number\day.\number\month.\number\year}

% -----------------------------------------------------------------------
\endinput

