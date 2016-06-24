
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

## Si1x1: comparing RpS to Mejia
set output 'fig-Si1x1-Mejia_RpS.tex'
set key at 3.45,0.49
set xrange [2.5:5]
set yrange [0:0.5]
set xtics auto
set ytics 0.1
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):3 t 'with MR' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "data/Si1x1/Rif-Mejia.vnl.scissor0.70.3-layer.dat"             u (2*$1):3 t 'w/o MR'  dt 4 lw 4.0 lc rgb "#dc322f" w l,\
  "data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($3/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####

## Si1x1: comparing RsP to Mejia
set output 'fig-Si1x1-Mejia_RsP.tex'
set key at 3.45,0.098
set xrange [2.5:5.0]
set yrange [0:0.1]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{sP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):4 t 'with MR' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "data/Si1x1/Rif-Mejia.vnl.scissor0.70.3-layer.dat"             u (2*$1):4 t 'w/o MR'  dt 4 lw 4.0 lc rgb "#dc322f" w l,\
  "data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($4/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####

#    EOF
