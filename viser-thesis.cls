\ProvidesClass{viser-thesis}[2023/07/31 School of Electrical and Computer Engineering Thesis LaTeX Class]

\LoadClass[12pt]{article}

\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[serbian]{babel}% For language support
\RequirePackage{graphicx}% For images
\RequirePackage{mathptmx}% For font similar to Times New Roman
\RequirePackage{tabularx}

\newcommand{\indeks}[1]{\def\@indeks{#1}}
\newcommand{\sprogram}[1]{\def\@sprogram{#1}}
\newcommand{\mentor}[1]{\def\@mentor{#1}}
\newcommand{\prviZadatak}[1]{\def\@prviZadatak{#1}}
\newcommand{\drugiZadatak}[1]{\def\@drugiZadatak{#1}}
\newcommand{\treciZadatak}[1]{\def\@treciZadatak{#1}}

\renewcommand{\maketitle}{
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
\begin{flushleft}
\fontsize{14pt}{16.8pt}\selectfont
Kandidat: \textbf{\@author}

\bigskip
\bigskip
\bigskip

Broj indeksa: \textbf{\@indeks}

\bigskip
\bigskip
\bigskip

Studijski program: \textbf{\@sprogram}

\bigskip
\bigskip
\bigskip

Tema: \textbf{\@title}

\bigskip
\bigskip
\bigskip

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
