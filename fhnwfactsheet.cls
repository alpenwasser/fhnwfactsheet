\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fhnwfactsheet}[2017/03/15 v1.0 PDF-LaTeX class for FHNW fact sheets]
\LoadClass{article}
\pagestyle{empty}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{geometry}
\RequirePackage[sfdefault,light,scale=1]{FiraSans}
\geometry{a4paper,twoside=false}
\geometry{width=210mm,height=297mm,outer=5mm,inner=5mm,top=5mm,bottom=5mm}
\newlength{\factpagewidth}
\newlength{\factgraphicswidth}
\setlength{\factpagewidth}{200mm}
\setlength{\factgraphicswidth}{50mm}

% -------------------------------------------------------- %
% We put the entire page  inside a minipage environment to %
% make it  not take up  more space than a  single page. We %
% also set the height of that  minipage to zero so that it %
% stays on  the first page  no matter how much  content is %
% put inside it.                                           %
% -------------------------------------------------------- %
\newenvironment{factpage}
    {\noindent\begin{minipage}[t][0pt]{\factpagewidth}\maketitle}
    {\end{minipage}}

\newenvironment{overview}
    {\noindent\begin{minipage}{\textwidth}\Large}
    {\end{minipage}}

\newenvironment{content}
    {\begin{multicols}{3}}
    {\end{multicols}}

\newcommand{\factgraphics}[2]{%
    \includegraphics[width=\factgraphicswidth]{images/#1}%
    \includegraphics[width=\factgraphicswidth]{images/#2}%
    }

\newenvironment{students}{\begin{minipage}{\textwidth}}{\end{minipage}}
\newenvironment{coaches}{\begin{minipage}{\textwidth}}{\end{minipage}}
\newenvironment{partners}{\begin{minipage}{\textwidth}}{\end{minipage}}

%\newcommand{\mycommand}{\sffamily}
%\newenvironment
%\DeclareOption
%\ProcessOption
%\DeclareOption{draft}{\setlength{\overfullrule}{5pt}}
%\ProcessOptions\relax
%\AtBeginDocument % Part of the preamble!
%\AtEndDocument
% Identification
% Prelimintary Declarations
% Options
% More more declarations (main work stuff)
