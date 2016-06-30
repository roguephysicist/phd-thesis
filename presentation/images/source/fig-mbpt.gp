#!/usr/local/Cellar/gnuplot/5.0.3/bin/gnuplot -persist
#
#    
#       G N U P L O T
#       Version 5.0 patchlevel 3    last modified 2016-02-21 
#    
#       Copyright (C) 1986-1993, 1998, 2004, 2007-2016
#       Thomas Williams, Colin Kelley and many others
#    
#       gnuplot home:     http://www.gnuplot.info
#       faq, bugs, etc:   type "help FAQ"
#       immediate help:   type "help"  (plot window: hit 'h')
set terminal epslatex leveldefault color blacktext standalone "" 11 fontscale 1  size 5,3

set border lw 2
set zero 1e-08
set locale "en_US.UTF-8"

set xlabel '{\Large One-photon Energy (eV)}'
set xrange [2:7]
set yrange [0:60]
# set ytics 10
set format y ''

set linestyle 1 pt 7 ps 1 lw 3 lc rgb "black"

set label '{\Large Im[$\epsilon_{2}$]}' at 6,30

set output 'fig-mbpt01.tex'
p   "mbpt/exp.dat" u 1:3 t '' pt 7 ps 1 lw 1.0 lc rgb "black" w p,\
    "" u 1:3 smooth mcsplines t '' lw 3 lc rgb "black" w l,\
    1/0 t "Experiment" ls 1 w lp,\
    "mbpt/outrpanlf.mdf.brd" u 1:3 t 'DFT' pt 2 lw 6.0 lc rgb "#dc322f" w l

set output 'fig-mbpt02.tex'
p   "mbpt/exp.dat" u 1:3 t '' pt 7 ps 1 lw 1.0 lc rgb "black" w p,\
    "" u 1:3 smooth mcsplines t '' lw 3 lc rgb "black" w l,\
    1/0 t "Experiment" ls 1 w lp,\
    "mbpt/outrpanlf.mdf.brd" u 1:3 t 'DFT' dt 3 lw 6.0 lc rgb "#dc322f" w l,\
    "mbpt/outgwnlf.mdf.brd" u 1:3 t 'DFT + GW' dt 1 lw 6.0 lc rgb "#1ba362" w l

set output 'fig-mbpt03.tex'
p   "mbpt/exp.dat" u 1:3 t '' pt 7 ps 1 lw 1.0 lc rgb "black" w p,\
    "" u 1:3 smooth mcsplines t '' lw 3 lc rgb "black" w l,\
    1/0 t "Experiment" ls 1 w lp,\
    "mbpt/outgwnlf.mdf.brd" u 1:3 t 'DFT + GW' dt 3 lw 6.0 lc rgb "#1ba362" w l,\
    "mbpt/outexc.mdf.brd" u ($1+0.2):3 t 'BSE' dt 1 lw 6.0 lc rgb "#268bd2" w l

#EOF
