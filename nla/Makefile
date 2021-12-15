all: print.pdf slides.pdf

slides.pdf: print.pdf
	pdflatex ./slides
	pdflatex ./slides

print.pdf: print.tex top.tex print.bbl bases.tex conditioning.tex def-evp.tex inner.tex iterations.tex krylov.tex qr-decomposition.tex qr.tex similarity.tex sparse.tex vector-iterations.tex ../mathsim.sty
	-mkdir blocks
	pdflatex ./print
	makeindex ./print
	pdflatex ./print

scp: print.pdf
	scp print.pdf simserv01:WWW/notes/nla.pdf

clean:
	-rm *~ *.aux *.toc *.log blocks/* *.idx *.ind *.ilg *.stm *.out *.nav
