.PHONY: classmaterial debug all clean

classmaterial: print.pdf problems.pdf slides.pdf

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
	bibtex main
	makeindex main
	pdflatex main

print.pdf: *.tex
	mkdir -p blocks
	pdflatex print
	bibtex print
	makeindex print
	pdflatex print

crop.pdf: print.pdf
	pdfcrop print.pdf

chapters: print.pdf
	perl ../chapters.pl print

slides.pdf: main.pdf

allslides.pdf: main.pdf
	perl ../aux2slides.pl main.aux > iallslides.tex
	pdflatex allslides

png:	allslides.pdf
	mkdir -p png
	convert -density 300 -scale 960x720 -antialias allslides.pdf ./png/slide-%03d.png


problems.pdf: allslides.pdf
	grep Problem iallslides.tex > listprobs.tex
	pdflatex problems
	convert -density 300 -scale 960x720 -antialias problems.pdf ./png/problem-%02d.png

solutions.pdf: main.pdf
	perl -ni ../problem-fix.pl blocks/Problem*.tex
	pdflatex solutions

%.pdf: %.tex
	mkdir -p blocks
	pdflatex $<

.PHONY: png chapters
