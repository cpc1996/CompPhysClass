%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computational Physics Class: Lecture notes and Exercises
% Class File
% Created: 05/12/2022
%
% This class was downloaded from: https://github.com/cpc1996
%
% Author: Cao Cong Phuong
%
% Notes:
% 1) This class file defines the structure and layout of many types of exercise.
% 2) Code listing styles should not be edited.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%========================================================================================
%	CLASS DEFINITION AND PARAMETERS
%========================================================================================

\NeedsTeXFormat{LaTeX2e}

\newcommand{\classname}{CompPhysClass}
\ProvidesClass{\classname}[2022/12/05 LaTeX Class for Computational Physics at HUS]

%----------------------------------------------------------------------------------------

\providecommand{\baseclass}{article}

\RequirePackage{etoolbox}
\RequirePackage{xparse}

\newbool{hidelastedited}
\newbool{hidecomment}
\newbool{shownumber}
\newbool{codeCdefault}
\newbool{codePythondefault}
\newbool{codeMatlabdefault}

\boolfalse{hidelastedited}
\boolfalse{hidecomment}
\boolfalse{shownumber}
\boolfalse{codeCdefault}
\boolfalse{codePythondefault}
\boolfalse{codeMatlabdefault}

\DeclareOption{hidelastediteddate}{\booltrue{hidelastedited}}
\DeclareOption{hidecodecomment}{\booltrue{hidecomment}}
\DeclareOption{showcodenumber}{\booltrue{shownumber}}
\DeclareOption{codeC}{\booltrue{codeCdefault}}
\DeclareOption{codePython}{\booltrue{codePythondefault}}
\DeclareOption{codeMatlab}{\booltrue{codeMatlabdefault}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass[11pt,a4paper]{\baseclass}


%========================================================================================
%	COLORS
%========================================================================================

\RequirePackage[svgnames,table]{xcolor}

\definecolor{LightBlueHUS}{HTML}{007FC3}
\definecolor{DarkBlueHUS}{HTML}{000080}

%========================================================================================
%	REQUIRED PACKAGES
%========================================================================================

\RequirePackage{fontawesome5}
\RequirePackage{textcomp} 			% Supports the Text Companion fonts
\RequirePackage{latexsym}			% For LaTEX symbolic such as square, circuit, diamond
\RequirePackage{enumitem}			% For itemize and enumerate item symbol
\RequirePackage[tikz]{bclogo}
\RequirePackage{pifont} 			% For creating special symbol
\RequirePackage{fontenc}			% For selecting font encodings
\RequirePackage{titlesec}			% For various title and section styles
\RequirePackage{multicol}			% For multiple column document
\RequirePackage{vwcol} 				% For muticol with adjustable width
\RequirePackage{changepage} 		% For the adjustwidth environment

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{systeme}			% For system of equations

\RequirePackage[miktex]{gnuplottex}
\RequirePackage{pgfplots}			% For drawing high-quality function plots

\RequirePackage{graphicx}
\RequirePackage{wrapfig} 			% For wrapping text around figures
\RequirePackage{epstopdf} 			% For eps to pdf extension figure
\RequirePackage{subfig}				% For sub-figures
\RequirePackage{float} 				% For inserting picture in a column
\RequirePackage[export]{adjustbox}	% For more options of \includegraphics
\RequirePackage{caption} 			% For customising the captions
\captionsetup{labelfont=bf,font=small}
\captionsetup[subfloat]{labelformat=empty}

\RequirePackage{tabularx}
\RequirePackage{makecell}			% For making cell in table
\RequirePackage{multirow}			% For multiple row table
\RequirePackage{longtable} 			% For long table
\RequirePackage[figuresright]{rotating} % For sideways table

\RequirePackage{verbatim}
\RequirePackage{fancyvrb}			% For fancy verbatims

\RequirePackage{csquotes}			% For advanced facilities for inline and display quotations

\RequirePackage[style=numeric,backend=bibtex]{biblatex}
\RequirePackage[hidelinks]{hyperref}% For hyperlink
\RequirePackage{xurl}				% Break long URLs

%========================================================================================
%	DEFINE CUSTOM INFORMATION COMMANDS
%========================================================================================

\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}

%========================================================================================
%	CODE LISTING OPTIONS
%========================================================================================

\RequirePackage{listings}

%----------------------------------------------------------------------------------------
%https://tex.stackexchange.com/questions/33039/using-ttfamily-with-bfseries-or-how-to-enable-bold-in-fixed-width-font
\renewcommand{\ttdefault}{pcr}
\newenvironment{pcr}{\fontfamily{pcr}\selectfont}

\definecolor{backcolor}{HTML}{f5fffc}
\definecolor{darkpink}{rgb}{0.75,0.25,0.5}
\definecolor{cadetblue}{rgb}{.6,.8,.8}

%----------------------------------------------------------------------------------------

\lstset{
	tabsize			= 4,
	breaklines		= true,
	basicstyle		= \ttfamily\color{black}\bfseries\footnotesize,
	identifierstyle	= \ttfamily\color{black},
	keywordstyle	= \ttfamily\color{blue}\bfseries,  
	stringstyle		= \ttfamily\color{Red},
	commentstyle	= \itshape\color{cyan},
	%--------------------------------------
	frame			= l,
	upquote			= true,
	numberstyle		= \tiny\color{Gray},
	backgroundcolor	= \color{backcolor},
	rulecolor		= \color{lightgray},
	rulesepcolor	= \color{lightgray},
	showstringspaces=false
	keepspaces		= true, 
	belowcaptionskip= 1\baselineskip,
	xleftmargin		= \parindent,
	%	escapeinside	= {@}{@},
	numbersep		= 7pt
}

%----------------------------------------------------------------------------------------
%\ifbool{<condition>}{<code if condition is true>}{<code if condition is false>}
\ifbool{hidecomment}{
	\lstdefinestyle{codeC} {
		%https://www.pvv.ntnu.no/~berland/latex/docs/listings.pdf
		%https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX
		language		= [ISO]C++, 
		keywordstyle	= \ttfamily\color{blue}\bfseries,  
		stringstyle		= \ttfamily\color{Red},
		commentstyle	= \itshape\color{backcolor}, 
		morekeywords	= {FILE},
		%	emphstyle		= \ttfamily\color{red}\bfseries,
		%	emph			= { auto,break,case,char,const,continue,default,do,double,else,enum,extern,float,for,goto,if,int,long,register,return,short,signed,sizeof,static,struct,switch,typedef,union,unsigned,void,volatile,while,FILE},
		%https://tex.stackexchange.com/questions/283170/using-different-colors-for-different-keywords-in-lstlisting
		classoffset		= 1, % starting new class
		otherkeywords	= {\#include},
		morekeywords	= {\#include},
		keywordstyle	= \ttfamily\color{Green}\bfseries,
		morecomment		= [s][\bfseries\color{Orange}]{<a}{>},% a b d e f i l m n q r s t u v
		morecomment		= [s][\bfseries\color{Orange}]{<b}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<d}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<e}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<f}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<i}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<l}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<m}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<n}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<q}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<r}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<s}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<t}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<u}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<v}{>},
		morecomment		= [l][\bfseries\color{Green}]{\#define},
		classoffset		= 0
}}{
	\lstdefinestyle{codeC} {
		language		= [ISO]C++, 
		keywordstyle	= \ttfamily\color{blue}\bfseries,  
		stringstyle		= \ttfamily\color{Red},
		commentstyle	= \itshape\color{cyan}, 
		morekeywords	= {FILE},
		%	emphstyle		= \ttfamily\color{red}\bfseries,
		%	emph			= { auto,break,case,char,const,continue,default,do,double,else,enum,extern,float,for,goto,if,int,long,register,return,short,signed,sizeof,static,struct,switch,typedef,union,unsigned,void,volatile,while,FILE},
		%https://tex.stackexchange.com/questions/283170/using-different-colors-for-different-keywords-in-lstlisting
		classoffset		= 1, % starting new class
		otherkeywords	= {\#include},
		morekeywords	= {\#include},
		keywordstyle	= \ttfamily\color{Green}\bfseries,
		morecomment		= [s][\bfseries\color{Orange}]{<a}{>},% a b d e f i l m n q r s t u v
		morecomment		= [s][\bfseries\color{Orange}]{<b}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<d}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<e}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<f}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<i}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<l}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<m}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<n}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<q}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<r}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<s}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<t}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<u}{>},
		morecomment		= [s][\bfseries\color{Orange}]{<v}{>},
		morecomment		= [l][\bfseries\color{Green}]{\#define},
		classoffset		= 0,
}}

%----------------------------------------------------------------------------------------

\lstdefinestyle{plaintext} {
	%https://www.pvv.ntnu.no/~berland/latex/docs/listings.pdf
	%https://www.overleaf.com/learn/latex/Using_colours_in_LaTeX
	language		= bash, 
	keywordstyle	= \ttfamily\color{black}\bfseries,  
	stringstyle		= \ttfamily\color{black},
	commentstyle	= \itshape\color{gray}, 
	%	showspaces		= true,
	%	showstringspaces= true,
	showtabs		= true,
	tab				= \textcolor{lightgray}{$\to$},
	%	literate=*
	%	{0}{{{\color{darkpink}0}}}{1}
}

%----------------------------------------------------------------------------------------

\ifbool{hidecomment}{
	\lstdefinestyle{codeMatlab} {
		language		= Matlab,
		keywordstyle	= \ttfamily\color{blue}\bfseries,  
		stringstyle		= \ttfamily\color{magenta},
		commentstyle	= \itshape\color{backcolor},
		morecomment		= [l][\bfseries\color{backcolor}]{\%\%},
		morekeywords	= {syms,switch,case,otherwise,ones,class,inline,vectorize,factorial,xlim,ylim,ezplot,pie,ezmesh,ezsurf,ezcontour,ezplot3,solve,double,subs,fsolve,fminsearch,compose,jacobian,int,dblquad,triplequad,limit,finverse,simplify,taylor,symsum,evalin,symengine,matlabFunction,poly2sym,lsqcurvefit,ppval,dsolve,fnval},
		literate		=*,
		literate		=*
		{^}{\textasciicircum}{1}
}}{
	\lstdefinestyle{codeMatlab} {
		language		= Matlab,
		keywordstyle	= \ttfamily\color{blue}\bfseries,  
		stringstyle		= \ttfamily\color{magenta},
		commentstyle	= \itshape\color{LimeGreen},
		morecomment		= [l][\bfseries\color{red}]{\%\%},
		morekeywords	= {syms,switch,case,otherwise,ones,class,inline,vectorize,factorial,xlim,ylim,ezplot,pie,ezmesh,ezsurf,ezcontour,ezplot3,solve,double,subs,fsolve,fminsearch,compose,jacobian,int,dblquad,triplequad,limit,finverse,simplify,taylor,symsum,evalin,symengine,matlabFunction,poly2sym,lsqcurvefit,ppval,dsolve,fnval},
		literate		=*,
		literate		=*
		{^}{\textasciicircum}{1}
}}

%----------------------------------------------------------------------------------------

\ifbool{hidecomment}{
	\lstdefinestyle{codePython} {
		language		= Python,
		keywordstyle	= \ttfamily\color{blue}\bfseries,  
		stringstyle		= \ttfamily\color{LimeGreen},
		commentstyle	= \itshape\color{backcolor},
		morekeywords	= {self},
		emph			= {MyClass,__init__},
		emphstyle		= \ttb\color{red},
		literate		=*,
		literate		=*
		{^}{\textasciicircum}{1}
}}{
	\lstdefinestyle{codePython} {
		language		= Python,
		keywordstyle	= \ttfamily\color{blue}\bfseries,  
		stringstyle		= \ttfamily\color{LimeGreen},
		commentstyle	= \itshape\color{cadetblue},
		morekeywords	= {self},
		emph			= {MyClass,__init__},
		emphstyle		= \ttb\color{red},
		literate		=*,
		literate		=*
		{^}{\textasciicircum}{1}
}}

%----------------------------------------------------------------------------------------
%https://www.alanshawn.com/tech/2019/09/01/emulate-terminal.html
\definecolor{tergreen}{rgb}{0,0.6,0}
\definecolor{tergray}{rgb}{0.5,0.5,0.5}
\definecolor{termauve}{rgb}{0.58,0,0.82}
\definecolor{terminalbgcolor}{HTML}{330033}
\definecolor{terminalrulecolor}{HTML}{000099}
\lstdefinestyle{console} {
	backgroundcolor	= \color{terminalbgcolor},
	basicstyle		= \ttfamily\color{white}\bfseries\footnotesize,
	identifierstyle	= \ttfamily\color{white}\bfseries\footnotesize,
	breakatwhitespace=false,
	breaklines		= true,
	captionpos		= b,
	commentstyle	= \color{tergreen},
	deletekeywords	= {...},
	escapeinside	= {\%*}{*)},
	extendedchars	= true,
	frame			= single,
	keepspaces		= true,
	keywordstyle	= \color{blue},
	language		= {},
	morekeywords	= {*,...},
	numbers			= none,
	numbersep		= 5pt,
	framerule		= 2pt,
	numberstyle		= \color{tergray}\tiny\selectfont,
	rulecolor		= \color{terminalrulecolor},
	showspaces		= false,
	showstringspaces= false,
	showtabs		= false,
	stepnumber		= 2,
	stringstyle		= \color{termauve},
	tabsize			= 2,
	literate		=*
}

%========================================================================================
%	CLASS OPTIONS
%========================================================================================
%https://tex.stackexchange.com/questions/152773/please-tutor-the-usage-of-patchcmd-and-xpatch
%\patchcmd{<command>}{<code to replace>}{<code>}{<success>}{<failure>}

% Show linenumber in lstlisting
\ifbool{shownumber}{
	\lstset{
		numbers			= left,
		stepnumber		= 1 
	}
}{}

% Itemize and enumerate settings
\def\labelitemi{--}
\def\labelitemii{+}
\setlist[enumerate]{leftmargin=*}
\setlist[itemize]{nosep,noitemsep,leftmargin=*}

% lstlisting default language
\ifbool{codeCdefault}{\lstset{style=codeC}}{}
\ifbool{codePythondefault}{\lstset{style=codePython}}{}
\ifbool{codeMatlabdefault}{\lstset{style=codeMatlab}}{}

% Spacing settings
\setlength{\parskip}{1.2ex plus 0.3ex minus 0.3ex}
%\titlespacing{command}{left spacing}{before spacing}{after spacing}[right]
\titlespacing{\chapter}{0pt}{10pt}{10pt}
\titlespacing{\section}{0pt}{\parskip}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}

\titleformat{\section}{\color{DarkBlueHUS}\normalfont\Large\bfseries}
	{\color{DarkBlueHUS}\thesection}{}{}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% Hyperlink settings
\hypersetup{
	colorlinks	= true,
	linkcolor	= DarkBlueHUS,
	citecolor	= DarkBlueHUS,
	urlcolor	= blue
}

%========================================================================================
%	MARGINS
%========================================================================================

\RequirePackage{geometry}

\geometry{
	paper=a4paper,
	left=1.2cm,
	top=1cm,
	right=1cm,
	bottom=2cm
}

%========================================================================================
%	HEADERS AND FOOTERS
%========================================================================================

\RequirePackage{fancyhdr}		% For header and footer style
\RequirePackage{lastpage} 		% For the footer: page of total pages

\pagestyle{fancy}					% Configure page style
\fancyhf{} 							% Clearing default header and footer
\renewcommand{\headrulewidth}{0pt}	% Remove header line
\renewcommand{\footrulewidth}{0pt}	% Remove footer line

\rfoot{\bfseries\color{DarkBlueHUS}{\thepage}\ / \color{DarkBlueHUS}{\pageref{LastPage}}}

%https://tex.stackexchange.com/questions/462922/adding-text-above-page-number-on-last-page
\ifbool{hidelastedited}{
	\fancyfoot[L]{
		\color{DarkBlueHUS}{\subjectname}
	}
}{
	\fancyfoot[L]{
		\ifnum\value{page}=\getpagerefnumber{LastPage}%
		\color{DarkBlueHUS}{
			\subjectname\quad$\diamond$\quad
			Chỉnh sửa lần cuối: \today
		}\else
			\color{DarkBlueHUS}{
				\subjectname
		}\fi
	}
}

%========================================================================================
%	USEFUL CUSTOM COMMANDS
%========================================================================================

\newcommand{\infohead}{
	\noindent
	\begin{minipage}[t!]{0.07\textwidth}
		\raggedright
		\includegraphics[width=1.2cm]{\Ginput@path/header/logo.jpg}
	\end{minipage}
	\begin{minipage}[t!]{0.465\textwidth}
		\raggedright
		\scriptsize
		ĐẠI HỌC QUỐC GIA HÀ NỘI\\
		TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN\\
		Khoa Vật lý, Bộ môn Tin học Vật lý\\
		P. 308D-T1, 334 Nguyễn Trãi, Thanh Xuân, Hà Nội\\% – ĐT: 04. 35584085\\
		\rule[5pt]{1.8\textwidth}{0.4pt}
	\end{minipage}
	\begin{minipage}[t!]{0.5\textwidth}
		\raggedright
		% https://tex.stackexchange.com/questions/26951/letting-graphics-overflow-over-page-edge
		\scalebox{-1}[1]{
			\includegraphics[
			width=1.02\textwidth,
			set height=1.2cm,
			left=\textwidth
			]{\Ginput@path/header/portrait.jpg}
		}
	\end{minipage}
}

%----------------------------------------------------------------------------------------

\newcommand{\head}[1]{\begin{center} \LARGE \bf \color{DarkBlueHUS}{#1} \end{center}}

%----------------------------------------------------------------------------------------

\newcommand{\link}[2]{\href{#1}{\underline{\textit{#2}}}}

%----------------------------------------------------------------------------------------

\newcommand{\hand}{\faHandPointRight[regular]}
%http://mirrors.concertpass.com/tex-archive/graphics/bclogo/doc/bclogo-doc.pdf
\newcommand{\note}[3][\hand]{
\begin{bclogo}[
	couleur		= yellow!10, 
	couleurBord	= yellow!60, 
	epBord		= 0,	% Edge
	arrondi		= 0.2,	% Corner curve
	logo		= #1,	%\bclampe, \bcfleur
	marge		= 10, 
	barre		= none,
%	epBarre 	=  1,
%	ombre		= true, 
%	tailleOndu	= 3,
%	blur, 
	]{#2:}#3
\end{bclogo}\vspace{-7mm}
}

%----------------------------------------------------------------------------------------

\newcommand{\memo}[2]{\begin{itemize}[leftmargin=1.5em]
		\item[\hand] #1: #2
	\end{itemize}
}

%----------------------------------------------------------------------------------------

\makeatletter
\renewcommand{\env@matrix}[1][c]{%
	\hskip-\arraycolsep
	\let\@ifnextchar\new@ifnextchar
	\array{*\c@MaxMatrixCols #1}%
}
\makeatother

\newcommand\m[1]{\begin{matrix}[r]#1\end{matrix}} 
\newcommand\mb[1]{\begin{bmatrix}[r]#1\end{bmatrix}} 
\newcommand\mv[1]{\begin{vmatrix}[r]#1\end{vmatrix}} 

%----------------------------------------------------------------------------------------

% "np" = narrow page
%https://latex-tutorial.com/minipage-latex/
\newcommand{\np}[2][.47]{\begin{minipage}[t]{#1\textwidth} \raggedright #2 \end{minipage}}

%----------------------------------------------------------------------------------------

% "es" = explicit space
%https://tex.stackexchange.com/questions/50804/explicit-space-character
\newcommand{\es}[1][.3em]{%
	\textcolor{red}{
		\mbox{\kern.09em\vrule height.3ex}%
		\vbox{\hrule width#1}%
		\hbox{\vrule height.3ex}
	}
}

%----------------------------------------------------------------------------------------

% (Programing typing) Custom tabular with 2 columns
\newcommand{\tbl}[2]{ 
	\begin{tabular}{|l|l|}
		\hline \textbf{Input} & \textbf{Output} \\ \hline 
		\texttt{\begin{tabular}[t]{@{}l@{}} #1\qquad\qquad \end{tabular}} &
		\texttt{\begin{tabular}[t]{@{}l@{}} #2\qquad \end{tabular}} \\ \hline
	\end{tabular}
}

%----------------------------------------------------------------------------------------

% (Programing typing) Problem type i: full description and example
\newcommand{\problemi}[6][0.55]{ 
	{#2}\par
	\begin{minipage}[t!]{#1\textwidth}
		\textbf{Input}\\{#3}\par
		\textbf{Output}\\{#4}
	\end{minipage}\qquad
	\begin{minipage}[t!]{\textwidth}
		\raggedright
		\tbl{#5}{#6}
	\end{minipage}
}

%----------------------------------------------------------------------------------------

% (Programing typing) Problem type ii: full description without example
\newcommand{\problemii}[4][0.45]{ 
	{#2}\par
	\begin{minipage}[t!]{#1\textwidth}
		\textbf{Input}\\{#3}
	\end{minipage}\qquad
	\begin{minipage}[t!]{\textwidth-#1\textwidth}
		\raggedright
		\textbf{Output}\\{#4}
	\end{minipage}\par
}

%----------------------------------------------------------------------------------------

% (Programing typing) Extra example
\newcommand{\example}[3][0.55]{
	\begin{minipage}[t!]{#1\textwidth} \quad
	\end{minipage}\qquad
	\begin{minipage}[t!]{0.45\textwidth}
		\raggedright
		\tbl{#2}{#3}
	\end{minipage}
}

%----------------------------------------------------------------------------------------

% (Programing typing) Plotting sierpinski carpet
%https://tex.stackexchange.com/questions/341791/generating-a-sierpinski-carpet-with-tikz
\newcount\sierpinskiorder
\newcommand{\sierpinskicarpet}[2][]{%
	\tikzset{sierpinski/.cd,#1}%
	\sierpinskiorder=#2\relax%
	\path [sierpinski/background/.try] (0,0) rectangle (1,1);
	\SierpinskiCarpet}
\def\SierpinskiCarpet{{%
	\ifnum\sierpinskiorder>0\relax
	\path [sierpinski/foreground/.try] (1/3, 1/3) rectangle ++(1/3, 1/3);
	\advance\sierpinskiorder by -1\relax
	\foreach \x in {0,...,2}{\foreach \y in {0,...,2}{
		\begin{scope}[shift={(\x/3,\y/3)},scale=1/3]
			\SierpinskiCarpet
		\end{scope}
	}}
	\fi
}}

%----------------------------------------------------------------------------------------



%\newbox\verbbox

\endinput






