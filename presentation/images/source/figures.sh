#!/bin/bash

## plotex - for creating plots in pdf from gnuplot epslatex files
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

plotex plots.gp

mv fig-*.pdf ../
