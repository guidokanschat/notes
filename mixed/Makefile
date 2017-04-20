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

main.pdf: *.tex
	mkdir -p blocks
	pdflatex main
	makeindex main
	pdflatex main

print.pdf: *.tex
	mkdir -p blocks
	pdflatex print
	makeindex print
	pdflatex print
	pdfcrop print.pdf

problems.pdf: main.pdf
solutions.pdf: main.pdf

%.pdf: %.tex
	mkdir -p blocks
	pdflatex $<
