\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{msulabm}[2019/04/12 UChicago Lab Manual]

%\renewcommand{\normalsize}{\fontsize{12pt}{0pt}\selectfont}
%\setlength{\textwidth}{

\DeclareOption{debug}{
 \AtEndOfClass{\RequirePackage{lineno}}
 \AtBeginDocument{\linenumbers}
 }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\AtBeginDocument{
	\specialcomment{solution}{\begingroup \color{red} \textbf{Solution: }}{\endgroup}
%	\excludecomment{solution}
}

\newif\ifanswerkey
\answerkeyfalse

\DeclareOption{answerkey}{
	\answerkeytrue
}

\ProcessOptions\relax

\ifanswerkey
\else
 \AtBeginDocument{\excludecomment{solution}}
\fi

\LoadClass[letterpaper]{memoir}

\RequirePackage{environ} % provides \NewEnviron command, to access arguments in the final code of the environment
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{comment}

%\chapterstyle{bianchi}
%\chapterstyle{lyhne}
\chapterstyle{veelo}

% make the normal text sans-serif. This is helpful for dyslexic readers. See http://www.dyslexic.com/fonts
%\renewcommand{\familydefault}{\sfdefault}

\renewcommand{\@chapapp}{Lab}
\renewcommand{\contentsname}{Labs}

% this allows us to define a style for the entire row of a table, once, instead of needing to reapply the style in every cell.
\newcolumntype{b}{>{\global\let\currentrowstyle\relax}}
\newcolumntype{^}{>{\currentrowstyle}}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
  #1\ignorespaces
}

\settrims{0pt}{0pt}
\setlrmarginsandblock{3cm}{3cm}{*}
\setulmarginsandblock{3cm}{3cm}{*}
\checkandfixthelayout

% List only chapters in table of contents, not anything lower in depth like sections
%\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}

% Add formatting for Investigation, Activity, Question, and Prediction, to match format of RealTime Physics
\newcounter{investigation}[chapter]
\newcommand{\investigation}[1]{
 \refstepcounter{investigation}
 \vspace{1em}
 \par\noindent\Large\textbf{\MakeTextUppercase{Investigation \theinvestigation: #1}}\normalsize
 \vspace{-0.7\baselineskip}
 \par\noindent\rule{\textwidth}{1pt}
 \vspace{-1em}
}

\newcounter{activity}[investigation]
\newcommand{\activity}[1]{
 \refstepcounter{activity}
 \vspace{0.5em}
 \par\noindent\Large\textbf{Activity \theinvestigation-\theactivity: #1}\normalsize
 \vspace{0.3em}
}

% the first optional argument is the length of the blank space needed to answer the question. Minipage is so the space for the answer is on the same page as the question. I removed the minipage and added a * to the \vspace command - it should preserve the vertical whitespace, while allowing elements (and the whitespace itself) to cross pagebreaks.
\newcounter{prediction}[investigation]
\NewEnviron{prediction}[1][\answerskip]{
 \refstepcounter{prediction}
 \vspace{0.7em}
 \par\noindent
% \begin{minipage}{\textwidth}
  \textbf{Prediction \theinvestigation-\theprediction: }\ignorespaces
  \BODY
  \vspace*{#1}
% \end{minipage}
}

% the first optional argument is the length of the blank space needed to answer the question. Minipage is so the space for the answer is on the same page as the question. I removed the minipage and added a * to the \vspace command - it should preserve the vertical whitespace, while allowing elements (and the whitespace itself) to cross pagebreaks.
\newcounter{question}[investigation]
\NewEnviron{question}[1][\answerskip]{
 \refstepcounter{question}
 \vspace{0.7em}
 \par\noindent
% \begin{minipage}{\textwidth}
  \textbf{Question \theinvestigation-\thequestion: }\ignorespaces
  \BODY
  \vspace*{#1}
% \end{minipage}
}

% Steps to follow in an activity. These are numbered lists, but we don't always want to be in a list environment during an activity. So the steps continue the enumerate counter from before.
\newcounter{steps}[chapter]
\NewEnviron{steps}{
 \begin{enumerate}
 \setcounter{enumi}{\thesteps}
 \BODY
 \setcounter{steps}{\theenumi}
 \end{enumerate}
}