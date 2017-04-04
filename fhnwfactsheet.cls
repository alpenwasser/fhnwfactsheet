\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fhnwfactsheet}[2017/03/15 v1.0 PDF-LaTeX class for FHNW fact sheets]
\newif\if@english
\newif\if@german
\DeclareOption{english}{\@englishtrue\@germanfalse}
\DeclareOption{german}{\@germantrue\@englishfalse}
\DeclareOption{deutsch}{\@germantrue\@englishfalse}
\ExecuteOptions{english,german,deutsch}
\ProcessOptions

\LoadClass{article}
\pagestyle{empty}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{geometry}
\RequirePackage[sfdefault,light,scale=1]{FiraSans}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{tcolorbox}
\if@english
    \RequirePackage[english]{babel}
\fi
\if@german
    \RequirePackage[ngerman]{babel}
\fi

\geometry{a4paper,twoside=false}
\newlength{\factpageouter}
\newlength{\factpageinner}
\newlength{\factpagetop}
\newlength{\factpagebottom}
\newlength{\factpagewidth}
\newlength{\factgraphicswidth}
\newlength{\testl}
\setlength{\factpageouter}{15mm}
\setlength{\factpageinner}{15mm}
\setlength{\factpagetop}{10mm}
\setlength{\factpagebottom}{15mm}
\setlength{\factpagewidth}{\paperwidth}
\addtolength{\factpagewidth}{-\factpageinner}
\addtolength{\factpagewidth}{-\factpageouter}
\setlength{\factgraphicswidth}{50mm}
\geometry{outer=\factpageouter,inner=\factpageinner,%
          top=\factpagetop,    bottom=\factpagebottom}

% -------------------------------------------------------------------------- %
% We put the entire  page inside a minipage environment to  make it not take %
% up more space than a single page. We  also set the height of that minipage %
% to zero so that  it stays on the first page no matter  how much content is %
% put inside it.                                                             %
% -------------------------------------------------------------------------- %
\newenvironment{factpage}
    {\noindent\begin{minipage}[t][0pt]{\factpagewidth}}
    {\end{minipage}}

% -------------------------------------------------------------------------- %
% Redefine Section Headings  to not be numbered by default. This  is done by %
% adding a * after its sixth argument. The rest of the command is similar to %
% what can be found in The LaTeX article.cls file.                           %
% -------------------------------------------------------------------------- %
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-2.5ex \@plus -1ex \@minus -.2ex}%
                                     {1ex \@plus.2ex}%
                                     {\fontfamily{jkpss}\selectfont\color{cyan!50!blue!70!black}}*}
                                     %{\normalfont\normalsize\bfseries}*}
                                     %{\normalfont\Large\bfseries}*}


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
\definecolor{title}{HTML}{EEBB00}
\iflanguage{english}{%
    \newcommand*{\lang@team}  {\textbf{Project Team: }}
    \newcommand*{\lang@coach}   {\textbf{Coach: }}
    \newcommand*{\lang@coaches} {\textbf{Coaches: }}
    \newcommand*{\lang@expert}  {\textbf{Expert: }}
    \newcommand*{\lang@experts} {\textbf{Experts: }}
    \newcommand*{\lang@partner} {\textbf{Industry Partner: }}
    \newcommand*{\lang@partners}{\textbf{Industry Partners: }}
}{}
\iflanguage{ngerman}{%
    \newcommand*{\lang@team}    {\textbf{Arbeitsgruppe: }}
    \newcommand*{\lang@coach}   {\textbf{Betreuer: }}
    \newcommand*{\lang@coaches} {\textbf{Betreuer: }}
    \newcommand*{\lang@expert}  {\textbf{Experte: }}
    \newcommand*{\lang@experts} {\textbf{Experten: }}
    \newcommand*{\lang@partner} {\textbf{Industriepartner: }}
    \newcommand*{\lang@partners}{\textbf{Industriepartner: }}
}{}

\newcommand*{\team}    [1]{\gdef\@team    {{\footnotesize\color{parties}\lang@team#1}}}
\newcommand*{\coach}   [1]{\gdef\@coach   {{\footnotesize\color{parties}\lang@coach#1}}}
\newcommand*{\coaches} [1]{\gdef\@coaches {{\footnotesize\color{parties}\lang@coaches#1}}}
\newcommand*{\expert}  [1]{\gdef\@expert  {{\footnotesize\color{parties}\lang@expert#1}}}
\newcommand*{\experts} [1]{\gdef\@experts {{\footnotesize\color{parties}\lang@experts#1}}}
\newcommand*{\partner} [1]{\gdef\@partner {{\footnotesize\color{parties}\lang@partner#1}}}
\newcommand*{\partners}[1]{\gdef\@partners{{\footnotesize\color{parties}\lang@partners#1}}}

\renewcommand\maketitle{\par
    \ifdef{\@coach}{%
        \ifdef{\@coaches}{%
            \ClassError{fhnwfactsheet}{Both 'coach' and 'coaches' field defined. Undefine one.}
                {Both the 'coach' and the 'coaches' field are defined. Only one of them should be.}
        }{}
    }{}
    \ifdef{\@expert}{%
        \ifdef{\@experts}{%
            \ClassError{fhnwfactsheet}{Both 'expert' and 'experts' field defined. Undefine one.}
                {Both the 'expert' and the 'experts' field are defined. Only one of them should be.}
        }{}
    }{}
    \ifdef{\@partner}{%
        \ifdef{\@partners}{%
            \ClassError{fhnwfactsheet}{Both 'partner' and 'partners' field defined. Undefine one.}
                {Both the 'partner' and the 'partners' field are defined. Only one of them should be.}
        }{}
    }{}
    \begingroup
        {\Huge\color{title}\@title}\par
        \vspace{1em}
        \ifdef{\@team}{\@team}{}\par
        \ifdef{\@coach}{\@coach}{}\par
        \ifdef{\@coaches}{\@coaches}{}\par
        \ifdef{\@expert}{\@expert}{}\par
        \ifdef{\@experts}{\@experts}{}\par
        \ifdef{\@partner}{\@partner}{}\par
        \ifdef{\@partners}{\@partners}{}\par
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

\newcommand\placeholderpics{%
    \newlength{\placeholderbase}
    \setlength{\placeholderbase}{55mm}
    \begin{tikzpicture}[x=\placeholderbase,y=\placeholderbase,draw=black!50!white,very thick]
        \draw (0,0) -- (1.618,1);
        \draw (0,1) -- (1.618,0);
        \draw (0,0) -- (1.618,0) -- (1.618,1) -- (0,1) -- cycle;
        \node[draw,fill=white] at (0.809,0.5) {\large Beautiful Picture!};
    \end{tikzpicture}
    \begin{tikzpicture}[x=\placeholderbase,y=\placeholderbase,draw=black!50!white,very thick]
        \draw (0,0) -- (1.618,1);
        \draw (0,1) -- (1.618,0);
        \draw (0,0) -- (1.618,0) -- (1.618,1) -- (0,1) -- cycle;
        \node[draw,fill=white] at (0.809,0.5) {\large Amazing Graphics!};
    \end{tikzpicture}
    {\footnotesize Beautiful Picture and Amazing Graphics}
}

\newcommand\fscontent[1]{\gdef\fs@content{#1}}
\newcommand\fs@makecontent{\par
    \vspace{1em}\begin{multicols}{3}
        \ifdef{\fs@content}{\fs@content}\par
    \end{multicols}
}

\newcommand\fssummary[1]{\gdef\fs@summary{#1}}
\newcommand\fs@makesummary{\par
    \vspace{0.25em}\noindent\begin{minipage}{\textwidth}\large
        \ifdef{\fs@summary}{\color{cyan!50!blue!70!black}\fs@summary}\par
    \end{minipage}
}

\newcommand\fsgraphics[1]{\gdef\fs@graphics{#1}}
\newcommand\fs@makegraphics{\par
    \vspace{1em}\noindent\begin{minipage}{\textwidth}\Large
        \ifdef{\fs@graphics}{\fs@graphics}\par
    \end{minipage}
}

\newcommand\factsheet[1]{\gdef\@factsheet{#1}}
\newcommand\makefactsheet{
    \begin{factpage}
        \maketitle
        \fs@makesummary
        \fs@makegraphics
        \fs@makecontent
        \tcbset{
            colback=cyan!50!blue!20!white,
            colframe=cyan!50!blue!70!black,
        }
        \begin{tcolorbox}[width=0.49\textwidth,arc=0mm,before=,after=\hfill]
            Nam  dui ligula,  fringilla a,  euismod sodales,
            sol-  licitudin  vel, wisi. Morbi  auctor  lorem
            non  justo.   Nam   lacus  libero,  pretium  at,
            lobortis  vitae, ul-  tricies et,  tellus. Donec
            aliquet,   tortor  sed   ac-  cumsan   bibendum,
            erat  ligula  aliquet   magna,  vi-  tae  ornare
            odio  metus   a  mi. Morbi   ac  orci   et  nisl
            hendrerit mollis. Suspendisse ut massa. Cras nec
            ante. Pellentesque a nulla.
        \end{tcolorbox}
        \begin{tcolorbox}[width=0.49\textwidth,arc=0mm,nobeforeafter]
            Nam  dui ligula,  fringilla a,  euismod sodales,
            sol-  licitudin  vel, wisi. Morbi  auctor  lorem
            non  justo.   Nam   lacus  libero,  pretium  at,
            lobortis  vitae, ul-  tricies et,  tellus. Donec
            aliquet,   tortor  sed   ac-  cumsan   bibendum,
            erat  ligula  aliquet   magna,  vi-  tae  ornare
            odio  metus   a  mi. Morbi   ac  orci   et  nisl
            hendrerit mollis. Suspendisse ut massa. Cras nec
            ante. Pellentesque a nulla.
        \end{tcolorbox}
    \end{factpage}
}

%\newcommand*{\partners}[1]{\gdef\@partners{{\footnotesize\color{parties}\lang@partners#1}}}
