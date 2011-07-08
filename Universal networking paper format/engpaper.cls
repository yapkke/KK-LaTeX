\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{engpaper}[2006/10/11 Engineering Publication Format by ykk]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classes and Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Declaring class in use
\newif\if@ieeeconfmode           \global\@ieeeconfmodefalse
\newif\if@ieeejrnlmode           \global\@ieeejrnlmodefalse
\newif\if@ieeemode               \global\@ieeemodefalse
\newif\if@sigaltmode             \global\@sigaltmodefalse
\newif\if@acmtransmode           \global\@acmtransmodefalse
\newif\if@acmmode                \global\@acmmodefalse
\newif\if@llncsmode              \global\@llncsmodefalse
\newif\if@articlemode            \global\@articlemodefalse
%Declaring options
\DeclareOption{ieeeconf}{\global\@ieeeconfmodetrue \global\@ieeemodetrue}
\DeclareOption{ieeejrnl}{\global\@ieeejrnlmodetrue \global\@ieeemodetrue}
\DeclareOption{sigalt}{\global\@sigaltmodetrue \global\@acmmodetrue}
\DeclareOption{acmtrans}{\global\@acmtransmodetrue \global\@acmmodetrue}
\DeclareOption{llncs}{\global\@llncsmodetrue}
\DeclareOption{article}{\global\@articlemodetrue}
%Passing options into packages
\DeclareOption{blacklink}{\PassOptionsToPackage{linkcolor=black}{hyperref}}
\DeclareOption{colorlink}{\PassOptionsToPackage{colorlinks}{hyperref}}
%Passing options into classes
\DeclareOption*{
\PassOptionsToClass{\CurrentOption}{article}
\PassOptionsToClass{\CurrentOption}{llncs}
\PassOptionsToClass{\CurrentOption}{sig-alternate}
\PassOptionsToClass{\CurrentOption}{acmtrans2m}
\PassOptionsToClass{\CurrentOption}{IEEEtran}}
%Loading the appropriate class
\ProcessOptions\relax
\if@articlemode \LoadClass{article} \fi
\if@llncsmode \LoadClass{llncs} \fi
\if@ieeeconfmode \PassOptionsToClass{conference}{IEEEtran} \LoadClass{IEEEtran} \fi
\if@ieeejrnlmode \PassOptionsToClass{journal}{IEEEtran} \LoadClass{IEEEtran} \fi
\if@acmtransmode \LoadClass{acmtrans2m} \fi
\if@sigaltmode \LoadClass{sig-alternate} \fi
%Loading packages
\ifx\pdfoutput\undefined
\if@acmtransmode \else \RequirePackage[hypertex]{hyperref} \fi
\RequirePackage{graphicx}
\else
%\if@acmtransmode \else \RequirePackage[pdftex,hypertexnames=false]{hyperref} \fi
\if@sigaltmode \else \RequirePackage[pdftex]{graphicx} \fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declaring Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Option commands
\newcommand{\ieeeonly}[1]{\if@ieeemode #1 \fi}
\newcommand{\ieeeconfonly}[1]{\if@ieeeconfmode #1 \fi}
\newcommand{\ieeejrnlonly}[1]{\if@ieeejrnlmode #1 \fi}
\newcommand{\acmonly}[1]{\if@acmmode #1 \fi}
\newcommand{\sigaltonly}[1]{\if@sigaltmode #1 \fi}
\newcommand{\acmtransonly}[1]{\if@acmtransmode #1 \fi}
\newcommand{\llncsonly}[1]{\if@llncsmode #1 \fi}
\newcommand{\articleonly}[1]{\if@articlemode #1 \fi}

\newcommand{\notieeeonly}[1]{\if@ieeemode \else #1 \fi}
\newcommand{\notieeeconfonly}[1]{\if@ieeeconfmode \else #1 \fi}
\newcommand{\notieeejrnlonly}[1]{\if@ieeejrnlmode \else #1 \fi}
\newcommand{\notacmonly}[1]{\if@acmmode \else #1 \fi}
\newcommand{\notsigaltonly}[1]{\if@sigaltmode \else #1 \fi}
\newcommand{\notacmtransonly}[1]{\if@acmtransmode \else #1 \fi}
\newcommand{\notllncsonly}[1]{\if@llncsmode \else #1 \fi}
\newcommand{\notarticleonly}[1]{\if@articlemode \else #1 \fi}

%New commands
\if@sigaltmode \else \if@llncsmode \else 
\newcommand{\email}[1]{} 
\fi \fi

\newcommand{\specialnotice}[1]{
\if@ieeemode \specialpapernotice{#1} \fi
\if@sigaltmode \subtitle{#1} \fi
\if@llncsmode \subtitle{#1} \fi}

\newcommand{\conference}[4][\number\year]{
\if@ieeeconfmode \gdef\@copyrightyear{#1} \gdef\@confname{#2} \gdef\@confplace{#3} \fi
\if@sigaltmode \conferenceinfo{#2}{#3} \CopyrightYear{#1} \crdata{#4} \fi}

\newcommand{\showconfinfo}{
\if@ieeeconfmode \copyright\@copyrightyear~\textit{\@confname\@confplace} \fi}

\newcommand{\edics}[1]{
\if@ieeeconfmode \begin{center} \bfseries EDICS Category: #1 \end{center} \fi}

\newcommand{\ieeepeerreview}{
\if@ieeemode \IEEEpeerreviewmaketitle \fi}

\newcommand{\listofkeywords}[1]{
\if@acmmode \keywords{#1} \fi
\if@ieeemode \begin{keywords} #1 \end{keywords} \fi}

\newcommand{\scalebiophoto}[1]{
\includegraphics[width=1in,height=1.25in,clip,keepaspectratio]{#1}}

%Article
\if@articlemode
\newcommand{\titlenote}[1]{}
\newcommand{\authorblock}[3]{#1\\#2\\Email:#3}
\newcommand{\biblio}[2][abbrvurl]{\bibliographystyle{#1}\bibliography{#2}}
\fi

%LLNCS
\if@llncsmode
\newcommand{\authorblock}[3]{#1}
\newcommand{\titlenote}[1]{\thanks{#1}}
\newcommand{\biblio}[2][splncs]{\bibliographystyle{#1}\bibliography{#2}}
\else
\newcommand{\inst}[1]{}
\newcommand{\institute}[1]{}
\fi

%ACM Sig-Alt
\if@sigaltmode
\newcommand{\authorblock}[3]{
\alignauthor #1\\
\affaddr{#2}\\
\email{#3}}
\newcommand{\biblio}[2][abbrvurl]{\bibliographystyle{#1}\bibliography{#2}}
\else
\newcommand{\numberofauthors}[1]{}
\newcommand{\balancecolumns}{}
\fi

\if@acmtransmode 
\newcommand{\authorblock}[3]{#1\\#2}
\newcommand{\titlenote}[1]{\begin{bottomstuff} #1 \end{bottomstuff}}
\newcommand{\biblio}[2][acmtrans]{\bibliographystyle{#1}\bibliography{#2}}
\newcommand{\receivednote}[1]{\begin{received} #1 \end{received}}
\else
\newcommand{\receivednote}[1]{}
\fi

\if@acmmode
\else
\newcommand{\terms}[1]{}
\newcommand{\category}[4][\relax]{}
\fi

%IEEEtran
\if@ieeeconfmode
\newcommand{\authorblock}[3]{
\authorblockA{#1}
\authorblockN{#2\\Email:#3}}
\fi

\if@ieeejrnlmode
\newcommand{\authorblock}[3]{#1}
\fi

\if@ieeemode
\newcommand{\biblio}[2][IEEEtran]{\bibliographystyle{#1}\bibliography{#2}}
\newcommand{\titlenote}[1]{\thanks{#1}}
\newcommand{\photobio}[3][\relax]{
\begin{biography}[#1]{#2}
#3 \end{biography}}
\newcommand{\nophotobio}[2]{\begin{biographynophoto}{#1} #2 \end{biographynophoto}}
\else
\def\authorrefmark#1{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger \or \ddagger\ddagger \else\textsuperscript{\expandafter\romannumeral#1}\fi}}}}
\newcommand{\IEEEmembership}[1]{}
\newcommand{\pubid}[1]{}
\newcommand{\PARstart}[2]{#1#2}
\newcommand{\photobio}[3][\relax]{}
\newcommand{\nophotobio}[2]{}
\newcommand{\IEEEtriggeratref}[1]{}
\newcommand{\appendices}{\appendix}
\fi
