all: print.pdf slides.pdf

only.tex:
	touch only.tex

slides-only.tex:
	touch slides-only.tex

slides.pdf: slides-only.tex print.pdf slides.tex slides-background.tex slides-conditioning.tex slides-ortho.tex slides-qr.tex slides-wilkinson.tex
	pdflatex -synctex=1 ./slides
	pdflatex -synctex=1 ./slides
	pdflatex -synctex=1 ./slides


print.pdf main.pdf: only.tex print.tex top.tex print.bbl ortho.tex bases.tex conditioning.tex def-evp.tex schur.tex inner.tex iterations.tex krylov.tex qr.tex real-qr.tex similarity.tex sparse.tex sparse-matrices.tex projection-iteration.tex vector-iterations.tex ev-projection.tex ev-lanczos.tex ev-arnoldi.tex inner.tex fd.tex ../mathsim.sty
	-mkdir blocks
	pdflatex -synctex=1 ./print
	makeindex ./print
	pdflatex -synctex=1 ./print
	pdflatex -synctex=1 ./print

scp: slides-only.tex print.pdf
	scp print.pdf simserv01:WWW/notes/nla.pdf

clean:
	-rm *~ *.aux *.toc *.log blocks/* *.idx *.ind *.ilg *.stm *.out *.nav
