all: all-pdf linear-pp-crop.pdf linear-pm-crop.pdf linear-mm-crop.pdf \
  linear-cp-crop.pdf linear-cm-crop.pdf linear-c0-crop.pdf

all-pdf: all.gnuplot logistic.dat logisticm.dat limit-circle.dat volterra.dat \
  linear-pp.dat linear-pm.dat linear-mm.dat \
  linear-cp.dat linear-cm.dat linear-c0.dat
	gnuplot all.gnuplot

%.dat: %.cc
	g++ $<
	./a.out > $@

%-crop.pdf: %.pdf
	pdfcrop $<
	rm $<
