TEX=pdflatex
OUT=report.pdf
TRASH=$(shell ls *.aux *.idx *.log *.toc *.ilg *.ind *.backup 2>/dev/null)

GFX=$(subst .dia,.pdf,$(shell ls gfx/*.dia))

.SUFFIXES : .pdf .tex .eps .dia

.dia.pdf:
	dia -e $(subst .dia,.eps,$<) $<
	epstopdf $(subst .dia,.eps,$<)

#.dia.eps:
#	dia -e $@ $<

.tex.pdf:
	$(TEX) $<
	$(TEX) $<

report.pdf: $(shell ls *.tex) $(GFX) style.sty

all:$(OUT)

view:all
	evince  $(OUT)&

clean:
	rm -f $(TRASH) $(OUT)

test:view
