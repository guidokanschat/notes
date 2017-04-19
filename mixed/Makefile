.PHONY: classmaterial debug all clean

classmaterial: print.pdf problems.pdf

debug:  main.pdf solutions.pdf

all: classmaterial debug

clean:
	rm -rf blocks
	rm -f *.bib
	rm -f *.aux
	rm -f *.frm
	rm -f *.idx
	rm -f *.log
	rm -f *.toc
	rm -f *.xml
	rm -f *.pdf

main.bbl: *.tex
	pdflatex main
	bibtex main

main.pdf: *.tex main.bbl
	mkdir -p blocks
	pdflatex problems
	pdflatex main
	makeindex main
	pdflatex main

%.pdf: %.tex
	mkdir -p blocks
	pdflatex $<
