all: print.pdf slides.pdf

slides.pdf: print.pdf slides.tex
	pdflatex -synctex=1 ./slides
	pdflatex -synctex=1 ./slides
	pdfjam --landscape --outfile slides-2.pdf slides.pdf 1,110-199,206


print.pdf: print.tex top.tex print.bbl bases.tex conditioning.tex def-evp.tex inner.tex iterations.tex krylov.tex qr-decomposition.tex qr.tex similarity.tex sparse.tex vector-iterations.tex ev-projection.tex ev-lanczos.tex ev-arnoldi.tex inner.tex ../mathsim.sty
	-mkdir blocks
	pdflatex -synctex=1 ./print
	makeindex ./print
	pdflatex -synctex=1 ./print

scp: print.pdf
	scp print.pdf simserv01:WWW/notes/nla.pdf

clean:
	-rm *~ *.aux *.toc *.log blocks/* *.idx *.ind *.ilg *.stm *.out *.nav
