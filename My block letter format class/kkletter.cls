\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kkletter}[2006/03/20 Letter Format by ykk]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{color,graphicx}
\RequirePackage{setspace}
\onehalfspacing

\gdef\@oddfoot{\hfill{Page \thepage} of \pageref{sec:done}\hfill}

\gdef\@receipientnaddress{Recipient and Address?}
\gdef\@opening{Dear Someone?}
\gdef\@closing{Yours sincerely}
\gdef\@signature{Your name and title?}

\def\senderaddress#1{\gdef\@senderaddress{#1}}
\def\date#1{\gdef\@date{#1}}
\def\receipientnaddress#1{\gdef\@receipientnaddress{#1}}
\def\opening#1{\gdef\@opening{#1}}
\def\closing#1{\gdef\@closing{#1}}
\def\signature#1{\gdef\@signature{#1}}
\def\enclosed#1{\gdef\@enclosed{#1}}
\def\cc#1{\gdef\@cc{#1}}

\newenvironment{letter}[1]{
\@ifundefined{@senderaddress}{}{\noindent\@senderaddress\vspace*{0.5cm}\\}
\@ifundefined{@date}{\noindent\today}{\noindent\@date}\vspace*{0.5cm}\\
\noindent\@receipientnaddress\vspace*{0.5cm}\\
\noindent{\@opening},
\begin{center}\textsc{#1}\end{center}
}{
\hspace*{1cm}\vspace*{0.5cm}\\
\noindent{\@closing},\vspace*{2cm}\\
\noindent\@signature\vspace*{0.5cm}
\@ifundefined{@enclosed}{}{\\\noindent{enclosed: }\@enclosed}
\@ifundefined{@cc}{}{\noindent{cc: }\\\@cc}
\label{sec:done}
}