#!/bin/bash

for file in *.tex; do
    name=`basename $file .tex`
    pdflatex $file
    pdfcrop ${name}.pdf ${name}.pdf
    rm -f ${name}.aux ${name}.fdb_latexmk ${name}.fls ${name}.log
    mv ${name}.pdf ../../
done

clear
