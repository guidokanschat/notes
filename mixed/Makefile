classmaterial: print.pdf problems.pdf

debug:  main.pdf solutions.pdf

main.bbl: *.tex
	pdflatex main
	bibtex main

main.pdf: *.tex main.bbl
	-mkdir blocks
	pdflatex problems
	pdflatex main
	makeindex main
	pdflatex main
