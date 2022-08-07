  %% ist-abstract.cls
  %% Copyright 2019 Daniel de Schiffart & João Gonçalves
% ---------------- Identification ----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ist-abstract}[2019/08/30 v0.0.1 Unofficial IST extended abstract class]

% ----------------- Initial Code -----------------
\typeout{_____________________________________________________________________________}
\typeout{_____________________________________________________________________________}
\typeout{__________________`:::::::::::::::::::::::::::::::::::::::`__________________}
\typeout{__________________.ooooooooooooooooooooooooooooooooooooooo`__________________}
\typeout{__________________.oooooooooooooooooooo/://:/+oooooooooooo`__________________}
\typeout{__________________.oooooooooooooooooo-`_:oo-_`-ooooooooooo`__________________}
\typeout{__________________.ooooooooooooooooo/___+oo+___+oooooooooo`__________________}
\typeout{__________________.ooooooooooooooooo/___+ooo+/+ooooooooooo`__________________}
\typeout{__________________.oooooooooo+///ooo/___+o///////ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+o.`___`.ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+o+/___/+ooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+oo/___/oooooooooo`__________________}
\typeout{__________________.oooooooooo:___+oo/___+oo/___/oooooooooo`__________________}
\typeout{__________________`oooooooooo:___+oo/___+oo/___/oooooooooo___________________}
\typeout{___________________+ooooooooo:___+oo/___+oo/___/ooooooooo+___________________}
\typeout{___________________-ooooooooo:___+oo/___+oo/___/ooooooooo-___________________}
\typeout{____________________+oooooooo+///ooo/___+ooo///ooooooooo/____________________}
\typeout{____________________.ooooooooo//+ooo/___+oooooooooooooo+`____________________}
\typeout{_____________________.+oooooo/__`ooo/___+ooooooooooooo+`_____________________}
\typeout{______________________`+ooooo+.`_/o+-_`:ooooooooooooo/`______________________}
\typeout{_______________________`:oooooo+/:////oooooooooooooo:________________________}
\typeout{_________________________.+ooooooooooooooooooooooo/`_________________________}
\typeout{___________________________-+ooooooooooooooooooo/.___________________________}
\typeout{_____________________________./ooooooooooooooo/._____________________________}
\typeout{_______________________________`:+ooooooooo+-`_______________________________}
\typeout{__________________________________.:+ooo+:.__________________________________}
\typeout{_____________________________________.-`_____________________________________}
\typeout{_____________________________________________________________________________}
\typeout{_____________________________________________________________________________}

\RequirePackage{etoolbox}
\newbool{@blackandwhite}
\newbool{@latinm}

% ------------ Declaration of Options ------------
\DeclareOption{bw}{\booltrue{@blackandwhite}}
\DeclareOption{lm}{\booltrue{@latinm}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% ------------- Execution of Options -------------
\ProcessOptions\relax

% --------------- Package Loading ----------------
\LoadClass{article}

% Define option hierarchy and set conflict resolution

\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[hidelinks, unicode=true]{hyperref}
\RequirePackage{geometry}

% Font selection
\RequirePackage[no-math]{fontspec}
\RequirePackage{unicode-math}

\renewcommand{\familydefault}{\sfdefault}
\ifbool{@latinm}{
    \setsansfont{Latin Modern Sans}
    %\setsansfont{Myriad Pro}
    %\setsansfont{Myriad Pro}
}{
    \setsansfont{Tex Gyre Heros}
}
\setmathfont[Scale = MatchLowercase]{TeX Gyre Dejavu Math}
\setmonofont[Scale = 1.10]{InconsolataN}

\RequirePackage{polyglossia}
\setmainlanguage[variant = british]{english}

\RequirePackage{microtype}
\RequirePackage{tocbibind}
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{totpages}

% Page layout - save space as much as possible
\geometry{
    a4paper,
    twoside,
    top = 2cm,
    bottom = 2.2cm,
    left=2cm,
    right=2cm,
}
\setlength{\columnsep}{7mm}
\setlength{\parskip}{2pt}
\setlength{\itemsep}{\parskip}
\raggedbottom
\ifbool{@latinm}{
    \setstretch{0.92}
}{}
% Equation spacing in makecover, because some packages loaded by the user 
% override those



\captionsetup{labelfont = bf, justification = justified, skip = 3pt, belowskip = -3pt}
\captionsetup[subfigure]{position = top, skip = 1pt}
\captionsetup[table]{position = top, skip = 3pt}

\ifbool{@blackandwhite}{
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
}{
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
}

\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-cyan},
	urlcolor	= {ist-cyan}
}

% class commands
\newrobustcmd*\ttitle{[Thesis Title]}
\newrobustcmd*\tauthor{[Candidate Name]}
\newrobustcmd*\temail{[example@example.com]}
\newrobustcmd*\tinstitution{[Institution]}
\newrobustcmd*\tdate{[Month and Year]}
\newrobustcmd*\tabstracttext{[Sample abstract text]}
\newrobustcmd*\tabstractkeywords{[Keyword 1, Keyword 2]}

% Define user commands to set the class metadata (and some PDF metadata entries too)
\newrobustcmd*\settitle[1]{\renewcommand\ttitle{#1}\hypersetup{pdftitle={#1}}}
\newrobustcmd*\setauthor[1]{\renewcommand\tauthor{#1}\hypersetup{pdfauthor={#1}}}
\newrobustcmd*\setauthoremail[1]{\renewcommand\temail{#1}}
\newrobustcmd*\setinstitution[1]{\renewcommand\tinstitution{#1}}
\newrobustcmd*\setdate[1]{\renewcommand\tdate{#1}}
\newrobustcmd*\setabstracttext[1]{\renewcommand\tabstracttext{#1}}
\newrobustcmd*\setabstractkeywords[1]{\renewcommand\tabstractkeywords{#1}}

% Section headings
\RequirePackage{secdot}
\sectiondot{subsection}
\sectionpunct{section}{. }
\sectionpunct{subsection}{. }
\sectionpunct{subsubsection}{. }

\RequirePackage{sectsty}
\sectionfont{\fontsize{12}{0}\selectfont}
\subsectionfont{\fontsize{10}{0}\selectfont}

% Slightly compact spacing from section headings
\RequirePackage[]{titlesec}
\titlespacing*{\section}{0pt}{*3}{*0.5}
\titlespacing*{\subsection}{0pt}{*2}{*0.5}
\titlespacing*{\subsubsection}{0pt}{*2}{*0.5}

% Colour settings
\ifbool{@blackandwhite}{
	\definecolor{ist-cyan}{cmyk}{1,1,1,1}
	\definecolor{ist-gray}{cmyk}{1,1,1,1}
}{
	\definecolor{ist-cyan}{cmyk}{1,0,0,0}
	\definecolor{ist-gray}{cmyk}{0.2,0,0,0.8}
}

\hypersetup{colorlinks,
	linkcolor	= {ist-cyan},
	citecolor	= {ist-cyan},
	urlcolor	= {ist-cyan}}


% Commands
\newrobustcmd{\makecover}{
    \twocolumn[
        \begin{@twocolumnfalse}
            \vspace{12mm}
            \begin{center}
                {\LARGE\ttitle}
                \par\vspace{5mm}
                {\large\tauthor}
                \par\vspace{2mm}
                {\small\ttfamily\href{mailto:\temail}{\temail}}
                \par\vspace{5mm}
                {\large\tinstitution}
                \par\vspace{2mm}
                {\large\tdate}
                \par\vspace{6mm}
            \end{center}
            \begin{abstract}
            {\normalsize
                \tabstracttext
                \par\vspace{1mm}
                {\noindent\textbf{Keywords:} \tabstractkeywords.}
            }
            \end{abstract}
            \par\vspace{5mm}
        \end{@twocolumnfalse}
    ]
    % More spacing configuration
    \setlength{\belowdisplayskip}{6pt}
    \setlength{\abovedisplayskip}{6pt}
    \setlength{\belowdisplayshortskip}{2pt}
    \setlength{\abovedisplayshortskip}{2pt}
}

% Metadata
\hypersetup{
    pdfcreator = {LuaTeX with the ist-abstract class},
}

