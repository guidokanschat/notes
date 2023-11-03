all: print.pdf slides.pdf

slides.pdf: print.pdf slides.tex slides-background.tex slides-conditioning.tex slides-ortho.tex slides-qr.tex 
	pdflatex -synctex=1 ./slides
	pdflatex -synctex=1 ./slides


print.pdf: print.tex top.tex print.bbl ortho.tex bases.tex conditioning.tex def-evp.tex schur.tex inner.tex iterations.tex krylov.tex qr.tex similarity.tex sparse.tex vector-iterations.tex ev-projection.tex ev-lanczos.tex ev-arnoldi.tex inner.tex ../mathsim.sty
	-mkdir blocks
	pdflatex -synctex=1 ./print
	makeindex ./print
	pdflatex -synctex=1 ./print

scp: print.pdf
	scp print.pdf simserv01:WWW/notes/nla.pdf

clean:
	-rm *~ *.aux *.toc *.log blocks/* *.idx *.ind *.ilg *.stm *.out *.nav
