#!/usr/local/Cellar/gnuplot/5.2.0/bin/gnuplot -persist
#
#    
#       G N U P L O T
#       Version 5.2 patchlevel 0    last modified 2017-09-01 
#    
#       Copyright (C) 1986-1993, 1998, 2004, 2007-2017
#       Thomas Williams, Colin Kelley and many others
#    
#       gnuplot home:     http://www.gnuplot.info
#       faq, bugs, etc:   type "help FAQ"
#       immediate help:   type "help"  (plot window: hit 'h')
set terminal epslatex standalone color
set locale "en_US.UTF-8"
set output 'rotxxx.tex'

set xlabel 'Photon Energy (eV)'
set ylabel 'Im$\left[\chi^{XXX}\right]$ ($\times 10^{6}$ pm$^{2}$/V)'
set xrange [1:3]
set yrange [-0.4:0.4]
set ytics 0.2

p 'out15.txt' u 1:3 t '$\Phi = 15' w l lw 4 dt 2 lc rgb 'blue',\
  'out30.txt' u 1:3 t '$\Phi = 30' w l lw 4 dt 1 lc rgb 'red',\
  'out90.txt' u 1:3 t '$\Phi = 90' w l lw 4 dt 1 lc rgb 'black'
