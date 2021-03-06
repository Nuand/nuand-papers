   Overview
===============

This repository contains documents pertaining to the
[bladeRF SDR](https://www.nuand.com). 

This repository is intended to contain information that should not
frequently change.  Living documents, such as installation guides for various
OS/distro are better suited for the 
[bladeRF wiki](https://www.github.com/nuand/bladeRF/wiki).

The documents contained in this repository provided 
under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/legalcode).

Community members are encouraged to propose and submit corrections,
updates, edits, and improvements via issues and pull requests on the
[nuand-papers issue tracker](https://www.github.com/nuand/nuand-papers/issues).
When making changes, please add yourself to the list of authors!

   Releases
===============

As documents are completed, they will be posted to the *Documentation* section on the [Nuand support page](https://nuand.com/support.php).
The GitHub releases page will no longer be updated, but previously published releases shall remain in place.

   Building 
===============

The documents in this repository are written in [LaTeX](http://www.latex-project.org/). 

The format is a modified version of Lunge Technology's [proposal template](https://github.com/lungetech/proposal-template).

The [latex-makefile](https://github.com/shiblon/latex-makefile) project is used to
to generate the documents from the LaTeX sources. This is checked out when running
`make` for the first time, or when running `make latex-makefile`.  This is removed
when running `make distclean`.

The [pdf2htmlEX](https://coolwanglu.github.io/pdf2htmlEX/) program is required
to build HTML files from generated PDF files.  HTML files will not be built if
this is not installed.

Running `make` should use the aforementioned build scripts to generate a PDF and
HTML file for each `.tex` file listed in the top-level `Makefile`.

For Ubuntu users, The following texlive packages are recommended:
 - texlive
 - texlive-base
 - texlive-binaries
 - texlive-extra-utils
 - texlive-font-utils
 - texlive-fonts-recommended
 - texlive-generic-recommended
 - texlive-latex-base
 - texlive-latex-recommended
 - texlive-latex-extra
 - texlive-math-extra
 - texlive-science

