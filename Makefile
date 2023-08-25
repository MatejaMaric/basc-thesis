thesis.pdf: thesis.tex viser-thesis.cls literatura.bib
	biber thesis
	pdflatex thesis.tex
	pdflatex thesis.tex
