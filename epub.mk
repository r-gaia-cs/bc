#======================================================================
# Makefile for Software Carpentry EPUB version of lessons.
#
# We use the HTML version generate by Jekyll to get better results
# with pandoc.
#======================================================================

EPUB = _site/book.epub

EPUB_SOURCE = _site/book.html

$(EPUB) : $(EPUB_SOURCE)
	pandoc -f html -t epub -o $@ \
	    --standalone \
	    --epub-stylesheet=_site/css/lesson.css \
	    --epub-metadata=_epub/metadata.xml \
	    --epub-chapter-level=2 \
	    $<
