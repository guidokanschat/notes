all: print.pdf slides.pdf

slides.pdf: print.pdf
	pdflatex slides
	pdflatex slides

print.pdf: print.tex top.tex pde.tex hilbert.tex sobolev.tex fem-intro.tex fem-apriori.tex fem-aposteriori.tex quadrature.tex ../iteration/itintro.tex ../iteration/richardson.tex condition.tex print.bbl
	pdflatex print
	makeindex print
	pdflatex print
