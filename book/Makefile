LATEX = pdflatex

ALL_TEX = $(wildcard *.tex)

all : book.pdf

book.pdf : preprocessor
	$(LATEX) book
	$(LATEX) book

preprocessor: $(ALL_TEX)
	for file in $^; do ./bin/preprocessor.py $${file} $${file}; done

clean :
	rm -f book.pdf *.aux *.log *.toc *~
