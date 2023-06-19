%% ntnuthesis.cls - a LaTeX class for theses at NTNU
%%
%% CC-BY CoPCSE@NTNU, 2019
%%
%% Partly merged, partly based on, and partly a simplification of
%% various previous thesis templates by Simon McCallum, Ivar Farup,
%% Kjetil Ørbekk an others, by CoPCSE@NTNU.

%% IDENTIFICATION

\xdef\ntnuthesisdate{2019/07/18}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntnuthesis}
 [\ntnuthesisdate\space
   CC-BY CoPCSE at NTNU 2019]


%% CLASS OPTIONS

% Package for some reason needed before the options
\RequirePackage{pdfpages}               % including pdf files

% One or twosided paging
\newcommand{\paging}{twoside}
\DeclareOption{oneside}{
  \renewcommand{\paging}{oneside}
}

% Title Page
\DeclareOption{titlepage}{
    \AtBeginDocument{
        \begin{titlepage}
            \maketitle
        \end{titlepage}
    }
}

% British
\newif\ifcapitalize
\DeclareOption{british}{
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\NTNU}{{N}orwegian {U}niversity of {S}cience and {T}echnology}
    \newcommand{\NTNUTrondheim}{{NTNU} in {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} in {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} in {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsbritish{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% American
\DeclareOption{american}{
    \capitalizetrue
    \def\papername{Paper}
    \newcommand{\NTNU}{{N}orwegian {U}niversity of {S}cience and {T}echnology}
    \newcommand{\NTNUTrondheim}{{NTNU} in {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} in {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} in {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Code listing}
        \renewcommand{\lstlistlistingname}{Code Listings}
        \crefname{listing}{Code listing}{Code listings}
        \crefname{paper}{Paper}{Papers}
        \addto\captionsamerican{
            \renewcommand{\contentsname}{Contents}
            \renewcommand{\listfigurename}{Figures}
            \renewcommand{\listtablename}{Tables}
            \renewcommand{\glossaryname}{Glossary}
            \renewcommand{\acronymname}{Acronyms}
        }
    }
}

% Bokmål
\DeclareOption{norsk}{
    \capitalizefalse
    \def\papername{Artikkel}
    \newcommand{\NTNU}{{N}orges teknisk-naturvitenskapelige universitet}
    \newcommand{\NTNUTrondheim}{{NTNU} i {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} i {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} i {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Kodeliste}
        \renewcommand{\lstlistlistingname}{Kodelister}
        \crefname{listing}{kodeliste}{kodelister}
        \crefname{equation}{ligning}{ligninger}
        \crefname{appendix}{vedlegg}{vedlegg}
        \crefname{paper}{artikkel}{artikler}
        \addto\captionsnorsk{
            \renewcommand{\appendixname}{Vedlegg}
            \renewcommand{\glossaryname}{Ordliste}
            \renewcommand{\acronymname}{Akronymer}
        }
    }
}

% Nynorsk
\DeclareOption{nynorsk}{
    \capitalizefalse
    \def\papername{Artikkel}
    \newcommand{\NTNU}{{N}oregs teknisk-naturvitskaplege universitet}
    \newcommand{\NTNUTrondheim}{{NTNU} i {T}rondheim}
    \newcommand{\NTNUGjoevik}{{NTNU} i {G}j\o{}vik}
    \newcommand{\NTNUAalesund}{{NTNU} i {\AA}lesund}
    \AtBeginDocument{
        \renewcommand{\lstlistingname}{Kodeliste}
        \renewcommand{\lstlistlistingname}{Kodelister}
        \crefname{listing}{kodeliste}{kodelister}
        \crefname{equation}{likning}{likningar}
        \crefname{table}{tabell}{tabellar}
        \crefname{figure}{figur}{figurar}
        \crefname{section}{avsnitt}{avsnitt}
        \crefname{chapter}{kapittel}{kapittel}
        \crefname{appendix}{vedlegg}{vedlegg}
        \crefname{paper}{artikkel}{artiklar}
        \renewcommand{\appendixname}{Vedlegg}
        \addto\captionsnynorsk{
            \renewcommand{\appendixname}{Vedlegg}
            \renewcommand{\glossaryname}{Ordliste}
            \renewcommand{\acronymname}{Akronym}
        }
    }
}

\ProcessOptions

%% CLASS FILE LOADING

\LoadClass[a4paper,11pt,openright,\paging]{report}

%% PACKAGE LOADING

%%% Custom pakker %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{siunitx}
\usepackage[version=3]{mhchem}
\usepackage{multirow}
\usepackage{float}
%\usepackage{lscape}
\usepackage{textcomp,gensymb}
\usepackage{listings}
\usepackage{lipsum}
\usepackage{longtable}

%colored boxes/circles for legends inside figure captions
\usepackage{color}
\usepackage{tikz}
\usetikzlibrary{shapes.geometric}

% Defining some gray scale colors outside the named colors
\definecolor{graa}{rgb}{0.66, 0.66, 0.66}
\definecolor{dimgray}{rgb}{0.40, 0.40, 0.40}
\definecolor{lysegraa}{rgb}{0.94, 0.94, 0.94}


\newcommand{\graybox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=black!10!gray](){};}}}

\newcommand{\customgraybox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=black!10!graa](){};}}}

\newcommand{\dimgraybox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=black!10!dimgray](){};}}}

\newcommand{\lightgraybox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=black!10!lightgray](){};}}}

\newcommand{\darkgraybox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=black!10!darkgray](){};}}}

\newcommand{\lysegraabox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=black!10!lysegraa](){};}}}

\newcommand{\whitebox}{\raisebox{0.01pt}{\tikz{\node[draw,scale=1.0,regular polygon, regular polygon sides=4,fill=none](){};}}}

\newcommand{\lightgraycircle}{\raisebox{0.5pt}{\tikz{\node[draw,scale=0.5,circle,fill=black!20!lightgray](){};}}}

\newcommand{\graycircle}{\raisebox{0.5pt}{\tikz{\node[draw,scale=0.5,circle,fill=black!20!gray](){};}}}

\newcommand{\darkgraycircle}{\raisebox{0.5pt}{\tikz{\node[draw,scale=0.5,circle,fill=black!20!darkgray](){};}}}

\newcommand{\lysegraacircle}{\raisebox{0.5pt}{\tikz{\node[draw,scale=0.5,circle,fill=black!20!lysegraa](){};}}}
%\usepackage[export]{adjustbox}

%%% Egendefinerte kommandoer %%%%%%%%%%%%%%%%%%%

\newcommand{\ml}{\si{\milli\liter} }
\newcommand{\gram}{\si{\gram} }
\newcommand{\mol}{\si{\mole}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}             % for special characters in input
\RequirePackage[T1]{fontenc}                % modern font encoding
\RequirePackage[charter, cal=cmcal]{mathdesign} % main font with math support
\RequirePackage[scaled=.88]{berasans}       % sans serif font
\RequirePackage[scaled=.82]{DejaVuSansMono} % monospace font (for code)
\RequirePackage{listings}                   % code listings
\RequirePackage{etoolbox}                   % fixing list of listings spacing
\RequirePackage{babel}                      % language specifics
\RequirePackage{geometry}                   % page layout
\RequirePackage{enumitem}                   % customising list appearance
\RequirePackage{graphicx}                   % including figures
\RequirePackage{amsmath}                    % advanced math typesetting
\RequirePackage[                            % subfigures with captions within figures
    font=footnotesize,                             % and customisation of captions
    labelfont=bf,
    margin=\parindent
]{caption}
\RequirePackage[                           % and subfigures with captions within figures
    font=small,
    labelfont=bf,
    margin=\parindent
]{subcaption}
\RequirePackage{xcolor}                     % selecting text color
\RequirePackage{emptypage}                  % empty pages should be blank
\RequirePackage{csquotes}             % recommended for biblatex
\RequirePackage{xpatch}



\RequirePackage[
    backend=biber,  
    style=authoryear,            % style=ieee orginalt
    maxbibnames=3,
    minbibnames=3,
    maxcitenames=3,
    mincitenames=1,
    citestyle=authoryear,      % try authoryear, but define comma and/or parentheses/brackets
    sorting=nty,
    dashed=false
]{biblatex}    

\renewcommand*{\nameyeardelim}{\addcomma\space}
\renewbibmacro*{volume+number+eid}{%
  \printfield{volume}
  \setunit*{\addnbthinspace}
  \printfield{number}
  \setunit{\addcomma\space}
  \printfield{eid}}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}
\renewbibmacro{in:}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% for bibliography
\RequirePackage{csvsimple}                  % tables from csv files
\RequirePackage{booktabs}                   % better formatting of tables
\RequirePackage{gnuplottex}                 % for generating gnuplots on the fly
\RequirePackage{hyperref}                   % interactive cross references
\ifcapitalize
    \RequirePackage[capitalize,noabbrev]{cleveref}   % automatic cross references
\else
    \RequirePackage[noabbrev]{cleveref}
\fi
\RequirePackage[acronym]{glossaries}        % create a glossary and acronym list

%% CUSTOMISATION

% Page geometry and spacing (same for even and odd pages)
\geometry{left=4cm, right=4cm, top=4cm, bottom=4.5cm}
\frenchspacing

% Roman page numbers from the beginning of the document
\pagenumbering{roman}
\setcounter{page}{3}

% Switch to Arabic page numbering at the beginning of the first numbered chapter
\newif\iffirstchapter
\firstchaptertrue
\let\std@chapter\@chapter
\def\@chapter{
    \iffirstchapter
        \pagenumbering{arabic}
        \firstchapterfalse
    \fi
    \std@chapter
}

% Add unnumbered chapters to table of contents and headings
\let\std@schapter\@schapter
\def\@schapter#1{
    \std@schapter{#1}
    \addcontentsline{toc}{chapter}{#1}
    \def\ch@ptermark{#1}
}

% Dotted line and tighter vertical spacing for chapters in the table of contents
\def\l@chapter#1#2{\@dottedtocline{1}{0em}{1.5em}{\bf #1}{\bf #2}}


% Allow for two versions of title and authors – full and short
\def\title#1{\def\@title{#1}\def\@shorttitle{#1}}
\def\shorttitle#1{\def\@shorttitle{#1}}
\def\author#1{\def\@author{#1}\def\@shortauthor{#1}}
\def\shortauthor#1{\def\@shortauthor{#1}}

% Headers and footers
\def\ps@ntnuheadings{%
    \let\@evenfoot\@empty
    \let\@oddfoot\@empty
    \def\@evenhead{\small\thepage\hfil\textit{\@shortauthor: \@shorttitle}}
    \def\@oddhead{\small\textit{\ch@ptermark}\hfil\thepage}
    \def\chaptermark##1{\def\ch@ptermark{\chaptername\ \thechapter: ##1}}
}
\pagestyle{ntnuheadings}

% Itemize and enumerate: tighter and with other symbols
\setlist[enumerate]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[enumerate,1]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,2]{label=\alph*., ref=\alph*}
\setlist[enumerate,3]{label=\roman*., ref=\roman*}
\setlist[itemize]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$-$}

% Make \fullcite show all authors irrespectively of maxcitenames
%\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}

% Colour palette
\definecolor{thesisblue}{rgb}{.15, .15, .6}
\definecolor{thesisred}{rgb}{.4, .05, .15}
\definecolor{thesisgreen}{rgb}{.2, .3, .2}

% Formatting of code listings
\lstset{
    frame=single,
    basicstyle=\fontsize{9}{10}\ttfamily,
    keywordstyle=\color{thesisblue}\bfseries,
    stringstyle=\color{thesisred},
    commentstyle=\color{thesisgreen},
    identifierstyle=\color{black},
    numberstyle=\fontsize{7}{8}\selectfont,
    literate=
        {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
        {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
        {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
        {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
        {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
        {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
        {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
        {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
        {Ã}{{\~A}}1 {ã}{{\~a}}1 {Õ}{{\~O}}1 {õ}{{\~o}}1
        {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
        {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
        {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
        {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
        {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1
}

% Ensure list of listings have additional spacing between chapters to match figures and tables
\pretocmd{\chapter}{\addtocontents{lol}{\protect\addvspace{10\p@}}}{}{}

% Settings for hyperref: setting all the links black for best printing. They will still be clickable in the PDF
\hypersetup{
    colorlinks=true,
    linkcolor=black,    % internal links (change box color with linkbordercolor)
    citecolor=black,    % links to bibliography
    filecolor=black,    % file links
    urlcolor=black      % external links
}

% Fix list of listings not rendering correctly for LaTeX generated by Sphinx, which uses literalblock instead of lstlisting
\let\l@literalblock\l@lstlisting

% Renew \lstlistoflistings command to avoid issues with incorrect headers for long lists
% Uses unnumbered chapter instead of a float like in the original source code.
% Based on source code for listings package https://ctan.uib.no/macros/latex/contrib/listings/listings.dtx line: 14635
\renewcommand*{\lstlistoflistings}{%
       \begingroup%
       \chapter*{\lstlistlistingname}%
       \parskip\z@\parindent\z@\parfillskip \z@ \@plus 1fil%
       \@starttoc{lol}%
       \endgroup%
       }%
