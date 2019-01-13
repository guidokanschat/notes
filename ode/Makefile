print.pdf : $(wildcard *.tex) ../mathsim.sty skript.bib
	pdflatex print
	pdflatex print
	makeindex print
	bibtex print
	pdflatex print

TAGS:
	etags *.tex definitions/*.tex theorems/*.tex

main.pdf : $(wildcard *.tex) ../mathsim.sty skript.bib
	pdflatex main
	pdflatex main
	makeindex main
	bibtex main
	pdflatex main


