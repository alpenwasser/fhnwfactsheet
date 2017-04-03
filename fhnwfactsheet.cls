\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fhnwfactsheet}[2017/03/15 v1.0 PDF-LaTeX class for FHNW fact sheets]
\LoadClass{article}
\pagestyle{empty}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{geometry}
\RequirePackage[sfdefault,light,scale=1]{FiraSans}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}

\newlength{\factpageouter}
\newlength{\factpageinner}
\newlength{\factpagetop}
\newlength{\factpagebottom}
\newlength{\factpagewidth}
\newlength{\factgraphicswidth}
\setlength{\factpageouter}{5mm}
\setlength{\factpageinner}{5mm}
\setlength{\factpagetop}{5mm}
\setlength{\factpagebottom}{5mm}
\setlength{\factpagewidth}{200mm}
\setlength{\factgraphicswidth}{50mm}

\geometry{a4paper,twoside=false}
\geometry{outer=\factpageouter,inner=\factpageinner,%
          top=\factpagetop,    bottom=\factpagebottom}

% -------------------------------------------------------------------------- %
% We put the entire  page inside a minipage environment to  make it not take %
% up more space than a single page. We  also set the height of that minipage %
% to zero so that  it stays on the first page no matter  how much content is %
% put inside it.                                                             %
% -------------------------------------------------------------------------- %
\newenvironment{factpage}
    {\noindent\begin{minipage}[t][0pt]{\factpagewidth}\maketitle}
    {\end{minipage}}

\newenvironment{overview}
    {\vspace{1em}\noindent\begin{minipage}{\textwidth}\Large}
    {\end{minipage}}

\newenvironment{content}
    {\begin{multicols}{3}}
    {\end{multicols}}
    %{\begin{minipage}{0.67\textwidth}\begin{multicols}{2}}
    %{\end{multicols}\end{minipage}}

\newcommand{\factgraphics}[2]{%
    \includegraphics[width=\factgraphicswidth]{images/#1}%
    \includegraphics[width=\factgraphicswidth]{images/#2}%
    }

%\newenvironment{students}{\begin{minipage}{\textwidth}}{\end{minipage}}
%\newenvironment{coaches}{\begin{minipage}{\textwidth}}{\end{minipage}}
%\newenvironment{partners}{\begin{minipage}{\textwidth}}{\end{minipage}}

% -------------------------------------------------------------------------- %
% Redefine Section Headings  to not be numbered by default. This  is done by %
% adding a * after its sixth  argument. The rest of the command is identical %
% to what can be found in The LaTeX article.cls file.                        %
% -------------------------------------------------------------------------- %
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\Large\bfseries}*}


% -------------------------------------------------------------------------- %
% Having subsections  or even  lower-tiered headings in  a document  such as %
% this one would be ridiculous. Remove them to make sure they are not used.  %
% -------------------------------------------------------------------------- %
\let\subsection\@undefined
\let\subsubsection\@undefined
\let\paragraph\@undefined
\let\subparagraph\@undefined

% Redefine Title Command

\definecolor{parties}{HTML}{666666}
\definecolor{title}{HTML}{AABB00}
\newcommand*{\authors}[1]{\gdef\@authors{{\footnotesize\color{parties}#1}}}
\newcommand*{\coaches}[1]{\gdef\@coaches{{\footnotesize\color{parties}#1}}}
\newcommand*{\expert} [1]{\gdef\@expert {{\footnotesize\color{parties}#1}}}
\newcommand*{\partner}[1]{\gdef\@partner{{\footnotesize\color{parties}#1}}}

\renewcommand\maketitle{\par
    \begingroup
        {\Huge\color{title}\@title}\par
        \vspace{1em}
        \@authors\par
        \@coaches\par
        \ifdef{\@expert}{\@expert}{}\par
        \ifdef{\@partner}{\@partner}{}\par
        \vspace{1em}
        \global\let\maketitle\relax
        \global\let\@maketitle\relax
        \global\let\title\relax
        \global\let\authors\relax
        \global\let\coaches\relax
        \global\let\expert\relax
        \global\let\partner\relax
        \global\let\date\relax
        \global\let\@title\@empty
        \global\let\@authors\@empty
        \global\let\@coaches\@empty
        \global\let\@expert\@empty
        \global\let\@partner\@empty
        \global\let\@date\@empty
    \endgroup
}
