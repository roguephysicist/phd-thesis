#!/bin/bash
## A script for compiling and cleaning this Ph.D. thesis.

pdflatex main.tex
bibtex main.aux
pdflatex main.tex
pdflatex main.tex

rm -f *.aux
rm -f appendices/*.aux
rm -f chapters/*.aux
rm -f frontbackmatter/*.aux

rm -f main.bbl
rm -f main.blg
rm -f main.lof
rm -f main.log
rm -f main.lol
rm -f main.lot
rm -f main.out
rm -f main.toc
rm -f main-blx.bib
rm -f main1-blx.aux
rm -f main.run.xml
