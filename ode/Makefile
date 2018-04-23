notes.pdf : $(wildcard *.tex) mathsim.sty skript.bib
	pdflatex notes
	pdflatex notes
	makeindex notes
	bibtex notes
	pdflatex notes

TAGS:
	etags *.tex definitions/*.tex theorems/*.tex

#main.pdf : $(wildcard *.tex) mathsim.sty skript.bib
#	pdflatex main
#	pdflatex main
#	makeindex main
#	bibtex main
#	pdflatex main


