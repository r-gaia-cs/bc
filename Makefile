#======================================================================
# Default Makefile for Software Carpentry bootcamps.  Use 'make' on
# its own to see a list of targets.
#
# To add new lessons, add their Markdown files to the MOST_SRC target.
# Order is important: when we build the single-page book version of
# the notes on the web site, lessons appear in the order in which they
# appear in MOST_SRC.
#
# If the source of those lessons isn't Markdown, whoever adds them is
# responsible for adding rules to convert them from whatever format
# they're in to Markdown.  The section titled "Create Markdown
# versions of IPython Notebooks" does this for IPython Notebooks; if
# more notebooks are added, make sure to add them to the target
# IPYNB_SRC.  If other source formats are used, add a new section to
# this Makefile and list it here.
#
# Note that this Makefile uses $(wildcard pattern) to match sets of
# files instead of using shell wildcards, and $(sort list) to ensure
# that matches are ordered when necessary.
#======================================================================

include vars.mk

#----------------------------------------------------------------------
# Settings.
#----------------------------------------------------------------------

# Installation directory on server.
INSTALL = $(HOME)/sites/software-carpentry.org/v5

# Jekyll configuration file.
CONFIG = _config.yml

#----------------------------------------------------------------------
# Specify the default target before any other targets are defined so
# that we're sure which one Make will choose.
#----------------------------------------------------------------------

all : commands

#----------------------------------------------------------------------
# Convert Markdown to HTML exactly as GitHub will when files are
# committed in the repository's gh-pages branch.
#----------------------------------------------------------------------

# Convert from Markdown to HTML.  This builds *all* the pages (Jekyll
# only does batch mode), and erases the SITE directory first, so
# having the output index.html file depend on all the page source
# Markdown files triggers the desired build once and only once.
$(INDEX) : $(ALL_SRC) $(CONFIG) $(EXTRAS)
	 jekyll -t build -d $(SITE)

#----------------------------------------------------------------------
# Targets.
#----------------------------------------------------------------------

## ---------------------------------------

## commands : show all commands.
commands :
	 @grep -E '^##' Makefile | sed -e 's/##//g'

## ---------------------------------------

## site     : build the site as GitHub will see it.
site : $(INDEX)

## check    : check that the index.html file is properly formatted.
check :
	@python bin/swc_index_validator.py ./index.html

## clean    : clean up all generated files.
clean : tidy
	rm -rf $(SITE) $(BOOK_MD)

## ---------------------------------------

## install  : install on the server.
install : $(INDEX)
	rm -rf $(INSTALL)
	mkdir -p $(INSTALL)
	cp -r $(SITE)/* $(INSTALL)
	mv $(INSTALL)/contents.html $(INSTALL)/index.html

## contribs : list contributors.
#  Relies on ./.mailmap to translate user IDs into names.
contribs :
	git log --pretty=format:%aN | sort | uniq

## fixme    : find places where fixes are needed.
fixme :
	grep -i -n FIXME $$(find novice -type f -print | grep -v .ipynb_checkpoints)

## tidy     : clean up odds and ends.
tidy :
	rm -rf \
	$$(find . -name '*~' -print) \
	$$(find . -name '*.pyc' -print) \
	$(BOOK_MD)

#----------------------------------------------------------------------
# Rules to launch builds of formats other than Markdown.
#----------------------------------------------------------------------

## ---------------------------------------

## ipynb    : convert IPython Notebooks to Markdown files.
#  This uses an auxiliary Makefile 'ipynb.mk'.
ipynb :
	make -f ipynb.mk

## html     : create HTML version of notes.
#  This uses an auxiliary Makefile 'book.mk'.
html :
	make -f book.mk html

## pdf      : create PDF version of notes.
#  This uses an auxiliary Makefile 'book.mk'.
pdf :
	make -f book.mk pdf

## ---------------------------------------
