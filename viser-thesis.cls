\ProvidesClass{viser-thesis}[2023/07/31 School of Electrical and Computer Engineering Thesis LaTeX Class]

\LoadClass[12pt]{article}

\RequirePackage[a4paper,margin=2.5cm,headheight=1.5cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[serbian]{babel}% For language support
\RequirePackage{graphicx}% For images
\RequirePackage{mathptmx}% For font similar to Times New Roman
\RequirePackage{tabularx}% More flexible tables
\RequirePackage{tocloft}% For table of contents formatting
\RequirePackage{titlesec}% For section title formatting
\RequirePackage{fancyhdr}% For headers and footers
\RequirePackage[backend=biber]{biblatex}% Bibliography support
\RequirePackage{csquotes}% For better integration between bable and biblatex
\RequirePackage{imakeidx}% Index support
\RequirePackage[hidelinks]{hyperref}% Adds supports for links (and makes table of contents clickable)

\newcommand{\indeks}[1]{\def\@indeks{#1}}
\newcommand{\studijskiProgram}[1]{\def\@studijskiProgram{#1}}
\newcommand{\mentor}[1]{\def\@mentor{#1}}
\newcommand{\predmet}[1]{\def\@predmet{#1}}
\newcommand{\prviZadatak}[1]{\def\@prviZadatak{#1}}
\newcommand{\drugiZadatak}[1]{\def\@drugiZadatak{#1}}
\newcommand{\treciZadatak}[1]{\def\@treciZadatak{#1}}

%\renewcommand{\cftdot}{\_}
% Setting space between dots for every section type
\renewcommand{\cftsecdotsep}{1}
\renewcommand{\cftsubsecdotsep}{1}
\renewcommand{\cftsubsubsecdotsep}{1}
% Adding a dot after the last number of every section type
\renewcommand{\cftsecaftersnum}{.}%
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

\titlelabel{\thetitle.\quad}% Add dot after sub/sub/section number

\fancyhf{}% Clear the header and footer
\fancyhead[R]{\textit{\@author, \@predmet}}
\fancyfoot[C]{\thepage}% Set the center of the footer to be the page number
\pagestyle{fancy}% Turn on the style (for header and footer)

\addbibresource{literatura.bib}

\makeindex[columns=2,intoc,options= -s index_style.ist]
\indexsetup{firstpagestyle=fancy}

\renewcommand{\maketitle}{
\thispagestyle{empty}
\begin{center}
\fontsize{16pt}{21.6pt}\selectfont
\MakeUppercase{visoka škola elektrotehnike i računarstva strukovnih studija}

\vfill

\textbf{\@author}

\bigskip

\MakeUppercase{\textbf{\@title}}

\fontsize{14pt}{16.8pt}\selectfont
\textbf{- završni rad -}

\vfill

\includegraphics[width=2cm]{docs/viser-logo}

Beograd, \@date

\end{center}
\newpage
}

\newcommand{\infopage}{
\thispagestyle{plain}
\begin{flushleft}
\fontsize{14pt}{16.8pt}\selectfont
Kandidat: \textbf{\@author}

\vspace{36pt}

Broj indeksa: \textbf{\@indeks}

\vspace{36pt}

Studijski program: \textbf{\@studijskiProgram}

\vspace{36pt}

Tema: \textbf{\@title}

\vspace{36pt}

Osnovni zadaci:
\begin{enumerate}
  \item \textbf{\@prviZadatak}
  \item \textbf{\@drugiZadatak}
  \item \textbf{\@treciZadatak}
\end{enumerate}
\end{flushleft}
\vfill
\begin{tabularx}{\textwidth}{ c X c }
  & & Mentor: \\[10pt]
 Beograd, \@date & & \rule{5cm}{0.4pt} \\
  & & \@mentor { prof.}
\end{tabularx}
\bigskip
\newpage
}
