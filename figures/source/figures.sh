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

cd structure
pdflatex Si2x1structure.tex
# pdfcrop Si2x1structure.pdf
rm -f Si2x1structure.log Si2x1structure.aux
mv Si2x1structure.pdf ../fig-4_1_01.pdf
cd ..

plotex plots.gp
plotex plots3D-Si1x1.gp
plotex plots3D-Si2x1.gp

mv fig-*.pdf ../

# for file in fig-*.pdf; do 
#     mv "${file}" ../"${file//_/.}"
# done
