\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nusthes}[2006/06/01 Thesis Format for National University of Singapore by ykk]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%blacklink
\DeclareOption{blacklink}{\PassOptionsToPackage{linkcolor=black}{hyperref}}
%pdftex
\DeclareOption{pdftex}{
\PassOptionsToPackage{pdftex}{color}
\PassOptionsToPackage{pdftex}{graphicx}
\PassOptionsToPackage{pdftex}{hyperref}}
%strict
\DeclareOption{strict}{\gdef\@nusstrict{yes}}
%fyp
\DeclareOption{fyp}{
\gdef\@degree{Bachelor of Engineering}
\newcommand{\titlepagebody}{
\begin{center}\hyphenpenalty=10000
\normalsize Submitted by\\ \expandafter{\@author}
\end{center}
\@ifundefined{@nusstrict}{\begin{center}\hyphenpenalty=10000
\normalsize Supervised by\\ \expandafter{\@supervisor}
\end{center}}{}
\begin{center}\hyphenpenalty=10000
\normalsize\expandafter{\@department}
\end{center}}
\newcommand{\titlepagefooter}{In partial fulfillment of the\\ requirements for the Degree of\\ \expandafter{\@degree}\\ \expandafter{\@university}}
\newcommand{\abstract}[1]{
\chapfont{Abstract}#1\newpage}}
%meng
\DeclareOption{meng}{
\gdef\@degree{Master of Engineering}}
%phd
\DeclareOption{phd}{
\gdef\@degree{Doctor of Philosophy}}
%phd
\DeclareOption{qe}{
\gdef\@degree{Doctor of Philosophy Qualifying Examination}
\newcommand{\titlepagefooter}{A report for\\ \expandafter{\@degree}\\ \expandafter{\@university}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Load Base Class -- Book
\PassOptionsToClass{a4paper}{book}
\PassOptionsToClass{10pt}{book}
\PassOptionsToClass{oneside}{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
%Packages
\RequirePackage{color,graphicx}
\RequirePackage[colorlinks,plainpages=false,hyperfootnotes=false,hypertexnames=false]{hyperref}
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{acronym}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Double Line Spacing
\onehalfspacing
%Plain Page Style
\pagestyle{plain}
%Labels Declaration
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Defaults of Variables
\@ifundefined{@degree}{\gdef\@degree{Master of Engineering}}{}
\gdef\@university{National University of Singapore}
\gdef\@department{Department of Electrical \& Computer Engineering}
\gdef\@submityear{\number\year}
\gdef\@subtitle{\space}
\gdef\@qualification{B.Eng. (Hons), NUS}
\gdef\@keywords{\space}
\gdef\nus@abbrev{\space Test \space MAC }
%Define Inputs
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\submityear#1{\gdef\@submityear{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}
\def\qualification#1{\gdef\@qualification{#1}}
\def\keywords#1{\gdef\@keywords{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Renewed Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Title Page
\renewcommand{\titlepage}{
\thispagestyle{empty}
\begin{center}\hyphenpenalty=10000
\large\bfseries\uppercase\expandafter{\@title}\\
\normalsize\mdseries\uppercase\expandafter{\@subtitle}
\end{center}\vfill
\titlepagebody
\vfill
\begin{center}\hyphenpenalty=10000
\normalsize \titlepagefooter
\end{center}\newpage}

%Title (Cover and Title)
\renewcommand{\maketitle}{
\coverpage
\titlepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% New Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coverpage
\newcommand{\coverpage}{
\thispagestyle{empty}\vspace*{0.4in}
\begin{center}\hyphenpenalty=10000
\Large\bfseries\uppercase\expandafter{\@title}\\
\large\mdseries\uppercase\expandafter{\@subtitle}
\end{center}\vfill
\begin{center}\hyphenpenalty=10000
\normalsize\bfseries\uppercase\expandafter{\@author}
\end{center}\vfill
\begin{center}\hyphenpenalty=10000
\normalsize\bfseries
\uppercase\expandafter{\@university}\vspace*{0.5cm} \\
\uppercase\expandafter{\@submityear}
\end{center}\newpage}

%Chapfont
\newcommand{\chapfont}[1]{
\noindent\textbf{\nohang\begin{Huge}#1\end{Huge}}\vspace*{1cm}\\}

%Acknowledgment
\newcommand{\acknowledgment}[1]{
\chapfont{Acknowledgment}#1\vfill
\begin{flushright}\today\end{flushright}\newpage}

%Title Page Body
\@ifundefined{titlepagebody}{
\newcommand{\titlepagebody}{
\begin{center}\hyphenpenalty=10000
\normalsize \uppercase\expandafter{\@author}\\ (\textit{\expandafter{\@qualification}})
\end{center}}}{}

%Title Page Footer
\@ifundefined{titlepagefooter}{
\newcommand{\titlepagefooter}{\uppercase{A Thesis submitted\\ for the Degree of \uppercase\expandafter{\@degree}\\ \uppercase\expandafter{\@department}\\ \uppercase\expandafter{\@university}\\ \number\year}}}{}

%Abstract
\@ifundefined{abstract}{
\newcommand{\abstract}[1]{
\noindent \hspace*{-0.3cm}
\begin{tabular}{lcl}
Name & : & \expandafter{\@author} \\
Degree & : & \expandafter{\@degree} \\
\@ifundefined{@nusstrict}{Supervisor(s) & : & \expandafter{\@supervisor} \\}{}
Department & : & \expandafter{\@department} \\
Thesis Title & : & \expandafter{\@title} \\
& & \begin{minipage}{8cm}
\expandafter{\@subtitle}
\end{minipage}\end{tabular}\vspace*{2cm}\\
\noindent
\chapfont{Abstract}#1\vfill
\noindent \@ifundefined{@nusstrict}{\hspace*{-0.3cm}}{\hspace*{0.2cm}}
\begin{tabular}{lcp{9cm}}
Keywords \hspace*{0.3cm} & : & \expandafter{\@keywords}
\end{tabular}\vfill
\newpage}}{}

%Strict Compliant
\@ifundefined{@nusstrict}{}{
\chapternumberfont{\centering\mdseries\uppercase}
\chaptertitlefont{\centering\mdseries\uppercase}
\sectionfont{\raggedright}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\chapfont}[1]{{\nohang\centering\mdseries\begin{Huge}#1\end{Huge}\vspace*{1cm}\\}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adapted from losymbol.sty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%losymbol.sty by gerry van dooren, may 1992, revised august 1992.
% elecgd@urc.tue.nl
%
%definition is nearly analogous to the setup for list of figures
%and list of tables; use same definition using \@starttoc,
%however default extension is now .los
%
\def\losymbolsname{List of Symbols}
\def\loabbrevname{List of Abbreviations}
\def\listofsymbolsnabbrev{
	\chapter*{\losymbolsname \@mkboth
	{\uppercase{\losymbolsname}}{\uppercase{\losymbolsname}}}
	\@starttoc{los}
	\chapter*{\loabbrevname \@mkboth
	{\uppercase{\loabbrevname}}{\uppercase{\loabbrevname}}}
	\begin{acronym}
	\@starttoc{loab}
	\end{acronym}
}
%
%command for putting text in file \jobname.loa is \addsymbol
%command that is used for actually producing text is called
%\makenicesymbolline
\def\addsymbol#1#2{%
\addtocontents{los}{\protect \makenicesymbolline{#1}{#2}}}
\def\addabbrev#1#2{%
\addtocontents{loab}{\protect \makeniceabbrevline{#1}{#2}}}
%
%physical dimensions of columns
\newdimen\@lcsym %width of left column
\@lcsym=2cm      %default 3cm
%
\newdimen\@mcsym %width of mid column (space)
\@mcsym=1cm      %default 2cm
%
\newdimen\@rcsym %width of right column
\@rcsym=\hsize   %initial width=textwidth
%
\advance\@rcsym by -\@lcsym %subtract lcsym
\advance\@rcsym by -\@mcsym %subtract mid
%
%command for producing the actual line uses standard minipages
%to cope with long definitions
%
\def\makenicesymbolline#1#2{%
\begin{minipage}[t]{\@lcsym}#1\end{minipage}%
$\hspace{\@mcsym}$%
\begin{minipage}[t]{\@rcsym}#2\end{minipage}\newline}
\def\makeniceabbrevline#1#2{%
%\begin{minipage}[t]{\@lcsym}#1\end{minipage}%
%$\hspace{\@mcsym}$%
%\begin{minipage}[t]{\@rcsym}#2\end{minipage}\newline
\acro{#1}{#2}}
%
%end of losymbol.sty

