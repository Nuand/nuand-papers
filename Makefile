# Build documents in nuand-papers repo
# This uses the 

TEMPLATE_REV := d1e296d85bcba8f464facb4b9e17404606020e48
LATEX_MAKEFILE_REV := 2.2.1-alpha10

DOCS := bladeRF_frs.pdf \
		bladeRF_windows_installer.pdf \

HTML := $(DOCS:.pdf=.html)

all: docs

docs: deps $(DOCS) $(HTML)

deps: latex-makefile .pdf2htmlEX_version

%.pdf: %.tex
	@if [ -e latex-makefile ]; then \
		echo ""; \
		echo "Building $@"; \
		echo "-------------------------------------------------------------"; \
		$(MAKE) -f latex-makefile/Makefile $@; \
	else \
		echo "" 1>&2; \
		echo "LaTeX Makefile is missing. Try running 'make deps'." 1>&2; \
		echo "" 1>&2; \
	fi

%.html: %.pdf
	@if [ -e .pdf2htmlEX_version ]; then \
		echo ""; \
		echo "Building $@"; \
		echo "-------------------------------------------------------------"; \
		pdf2htmlEX $< $@ 2>&1; \
	else \
		echo "" 1>&2; \
		echo "The pdf2htmlEX program is missing. Unable to build $@" 1>&2; \
		echo "" 1>&2; \
	fi


latex-makefile:
	@echo ""
	@echo "Checking out LaTeX makefile..."
	@git clone git@github.com:shiblon/latex-makefile.git && \
		cd latex-makefile && \
		git checkout -b waveform-doc $(LATEX_MAKEFILE_REV) 2>/dev/null 1>&2 && \
		./build

.pdf2htmlEX_version:
	@if pdf2htmlEX --version >/dev/null 2>&1; then \
		pdf2htmlEX --version > .pdf2htmlEX_version 2>&1; \
	else \
		echo "" 1>&2; \
		echo "pdf2htmlEX not found. Unable to build .html targets." >&2; \
		echo "" 1>&2; \
	fi

clean:
	@if [ -e latex-makefile/Makefile ]; then \
		make -f latex-makefile/Makefile clean; \
	fi

	rm -f *.pdf
	rm -f *.html


distclean: clean
	rm -rf template
	rm -f .pdf2htmlEX_version

.PHONY: clean distclean

