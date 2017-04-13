classmaterial: print.pdf problems.pdf

debug:  main.pdf solutions.pdf

main.pdf:
	-mkdir blocks
	pdflatex main
	pdflatex problems
	bibtex main
	pdflatex main
	makeindex main
	pdflatex main
