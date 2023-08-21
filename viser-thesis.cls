\ProvidesClass{viser-thesis}[2023/07/31 School of Electrical and Computer Engineering Thesis LaTeX Class]

\LoadClass[12pt]{article}

\RequirePackage[margin=2.5cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[serbian]{babel}% For language support
\RequirePackage{graphicx}% For images

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
