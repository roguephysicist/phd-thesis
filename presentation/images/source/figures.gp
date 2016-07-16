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
p   "data/exp.dat" u 1:3 t '' pt 7 ps 1 lw 1.0 lc rgb "black" w p,\
    "" u 1:3 smooth mcsplines t '' lw 3 lc rgb "black" w l,\
    1/0 t "Experiment" ls 1 w lp,\
    "data/outrpanlf.mdf.brd" u 1:3 t 'DFT' pt 2 lw 6.0 lc rgb "#dc322f" w l

set output 'fig-mbpt02.tex'
p   "data/exp.dat" u 1:3 t '' pt 7 ps 1 lw 1.0 lc rgb "black" w p,\
    "" u 1:3 smooth mcsplines t '' lw 3 lc rgb "black" w l,\
    1/0 t "Experiment" ls 1 w lp,\
    "data/outrpanlf.mdf.brd" u 1:3 t 'DFT' dt 3 lw 6.0 lc rgb "#dc322f" w l,\
    "data/outgwnlf.mdf.brd" u 1:3 t 'DFT + GW' dt 1 lw 6.0 lc rgb "#1ba362" w l

set output 'fig-mbpt03.tex'
p   "data/exp.dat" u 1:3 t '' pt 7 ps 1 lw 1.0 lc rgb "black" w p,\
    "" u 1:3 smooth mcsplines t '' lw 3 lc rgb "black" w l,\
    1/0 t "Experiment" ls 1 w lp,\
    "data/outgwnlf.mdf.brd" u 1:3 t 'DFT + GW' dt 3 lw 6.0 lc rgb "#1ba362" w l,\
    "data/outexc.mdf.brd" u ($1+0.2):3 t 'BSE' dt 1 lw 6.0 lc rgb "#268bd2" w l

unset label
unset arrow
set format y

abso(w,x,y,z)=(sqrt((w+y)**2+(x+z)**2))

set terminal epslatex leveldefault color blacktext standalone "" 11 fontscale 1  size 5,3.4
set output 'fig-rpp.tex'
set key at 3.5,2.4
set xrange [2.5:5]
set yrange [0:2.5]
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
set label '\large $E_{1}$' at 3.325,0.15
set label '\large $E_{2}$' at 4.2,0.15
p "data/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat"  u (2*$1):($2*0.5) t 'Theory ($\times 0.5$)' w l dt 1 lw 5 lc rgb "blue",\
  "data/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' pt 1 ps 1.5 lw 2.5 lc rgb "black" w p

unset label
unset arrow

set terminal epslatex leveldefault color blacktext standalone "" 11 fontscale 1  size 4.7,4
set output 'fig-rps.tex'
set key at 3.5,0.48
set xrange [2.5:5]
set yrange [0:0.5]
set xtics auto
set ytics 0.1
set label '\large $E_{1}$' at 3.425,0.03
set label '\large $E_{2}$' at 4.3,0.03
set ylabel '{\Large $\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
p "data/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat"      u (2*$1):3 t 'Theory'       dt 1 lw 5 lc rgb "blue" w l,\
  "data/mejiaPRB02_bergfeldPRL04.dat" u 1:($3/100) t 'Experiment' pt 1 ps 1.5 lw 2.5 lc rgb "black" w p
 
unset label
unset arrow

#EOF
