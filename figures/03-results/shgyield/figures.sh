#!/bin/bash
shopt -s extglob
GLOBIGNORE="*.mp*:*.log"
gnuplot gnuplot.gp
mpost --tex=latex metapost.mp
printf '\\documentclass[12pt]{article}\n\\usepackage{amsfonts,amsmath,mathrsfs}\n\\usepackage{graphicx,color}\n\\usepackage{ulem}\n\\usepackage{bm}\n\\textwidth=6.5in\n\\textheight=9.5in\n\\oddsidemargin=0in\n\\topmargin=-.7in\n\\headheight=0in\n\\headsep=0.25in\n\\topskip=0.0in\n\\pagestyle{empty}\n\\begin{document}\n\\begin{figure}\n\\begin{center}\n\\includegraphics[scale=1]{fig.0}\n\\end{center}\n\\end{figure}\n\\end{document}\n' > latex.tex
counter=2
for fig in `ls metapost.*`; do
    mv $fig fig.0
    latex latex.tex
    dvips -E -o fig${counter}.eps latex
    counter=$((counter+1))
done

unset GLOBIGNORE
rm *.mp* *.tex *.log *.aux latex.dvi fig.0
