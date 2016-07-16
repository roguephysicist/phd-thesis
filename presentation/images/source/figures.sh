#!/bin/bash

for file in *.tex; do
    name=`basename $file .tex`
    pdflatex $file
    # pdfcrop ${name}.pdf ${name}.pdf
    rm -f ${name}.aux ${name}.fdb_latexmk ${name}.fls ${name}.log
    # mv ${name}.pdf ../
done

function plotex() {
    local tex=(`grep "set output" $1 | grep -v '\#' | awk -F\' '{print $(NF-1)}'`)
    gnuplot $1
    for file in ${tex[@]}; do
        local name=`basename $file .tex`
        epstopdf ${name}-inc.eps
        pdflatex $file
        pdfcrop ${name}.pdf ${name}.pdf
        rm -f $name-inc.eps $name-inc.pdf $name.aux $name.log $file
    done
    clear
}

pdfcrop chis_inter.pdf chis_inter.pdf
pdfcrop chis_intra.pdf chis_intra.pdf
pdfcrop chis_intra_red.pdf chis_intra_red.pdf
pdfcrop chis_inter_red.pdf chis_inter_red.pdf
pdfcrop diag-system.pdf diag-system.pdf
pdfcrop diag-methods_us.pdf diag-methods_us.pdf
pdfcrop diag-methods_future.pdf diag-methods_future.pdf

plotex figures.gp

mv *.pdf ../

clear
