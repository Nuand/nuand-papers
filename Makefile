# Build documents in nuand-papers repo
# This uses the 

TEMPLATE_REV := d1e296d85bcba8f464facb4b9e17404606020e48
LATEX_MAKEFILE_REV := 2.2.1-alpha10

DOCS := bladeRF_user_guide.pdf \
		bladeRF_windows_installer.pdf \
		bladeRF_frs.pdf \

DEPS_INCLUDE = $(wildcard include/*.tex)

.SECONDEXPANSION:
DEPS_bladeRF_user_guide.pdf := $(wildcard bladeRF-user-guide/*.tex) \
							   include/template.tex
all: docs

docs: deps $(DOCS)

deps: latex-makefile

%.pdf: %.tex $(DEPS_INCLUDE) $$(DEPS_$$@)
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

latex-makefile:
	@echo ""
	@echo "Checking out LaTeX makefile..."
	@git clone git@github.com:shiblon/latex-makefile.git && \
		cd latex-makefile && \
		git checkout -b waveform-doc $(LATEX_MAKEFILE_REV) 2>/dev/null 1>&2 && \
		./build

clean:
	@if [ -e latex-makefile/Makefile ]; then \
		make -f latex-makefile/Makefile clean; \
	fi

	rm -rf output


distclean: clean
	rm -rf template

.PHONY: clean distclean

