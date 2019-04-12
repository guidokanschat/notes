all: print.pdf slides.pdf

slides.pdf: print.pdf
	pdflatex slides
	pdflatex slides

print.pdf: print.tex top.tex print.bbl
	pdflatex print
	makeindex print
	pdflatex print
