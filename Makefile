thesis.pdf: thesis.tex literatura.bib
	biber thesis
	pdflatex thesis.tex
	pdflatex thesis.tex
