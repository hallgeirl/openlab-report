TEX=pdflatex
OUT=report.pdf
TRASH=$(shell ls *.aux *.idx *.log *.toc *.ilg *.ind *.backup 2>/dev/null)

GFX=$(subst .eps,.pdf,$(shell ls gfx/*.eps))

.SUFFIXES : .pdf .tex .eps

.eps.pdf:
	epstopdf $<

.tex.pdf:
	$(TEX) $<
	$(TEX) $<

report.pdf: $(shell ls *.tex) $(GFX)

all:$(OUT)

view:all
	evince  $(OUT)&

clean:
	rm -f $(TRASH) $(OUT)

test:view
