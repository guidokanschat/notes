all: print.pdf slides.pdf

slides.pdf: print.pdf
	pdflatex ./slides
	pdflatex ./slides

print.pdf: print.tex top.tex orthopoly.tex stability.tex interpolation.tex splines.tex quadratur.tex lr.tex qr.tex least-squares.tex newton.tex sparse.tex print.bbl ../mathsim.sty
	-mkdir blocks
	pdflatex ./print
	makeindex ./print
	pdflatex ./print

scp: print.pdf
	scp print.pdf simserv01:WWW/notes/einf.pdf

clean:
	-rm *~ *.aux *.toc *.log blocks/* *.idx *.ind *.ilg *.stm *.out *.nav
