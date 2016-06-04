#!/bin/bash

pdflatex Si2x1structure.tex
# pdfcrop Si2x1structure.pdf
rm -f Si2x1structure.log Si2x1structure.aux
mv Si2x1structure.pdf struc-Si2x1-rot.pdf
cp struc-* ../../
