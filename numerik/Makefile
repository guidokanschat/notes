all: print.pdf slides.pdf

slides.pdf: print.pdf
	pdflatex slides
	pdflatex slides

print.pdf: print.tex top.tex orthopoly.tex stability.tex interpolation.tex splines.tex print.bbl
	-mkdir blocks
	pdflatex print
	makeindex print
	pdflatex print
