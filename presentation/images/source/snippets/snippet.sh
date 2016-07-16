#!/bin/bash
target="$1"

if [ -z ${target} ]; then
    printf "Missing target .tex file!\nExiting\n"
    exit
else    
    name=`basename ${target} .tex`
    xelatex -shell-escape ${target} && pdfcrop ${name}.pdf $name.pdf
    rm -rf $name.aux $name.log _minted-${name}/
    cp $name.pdf ../../
fi
