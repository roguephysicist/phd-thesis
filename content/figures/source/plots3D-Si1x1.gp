#!/usr/local/Cellar/gnuplot/5.0.3/bin/gnuplot -persist
#
#    
#    	G N U P L O T
#    	Version 5.0 patchlevel 3    last modified 2016-02-21 
#    
#    	Copyright (C) 1986-1993, 1998, 2004, 2007-2016
#    	Thomas Williams, Colin Kelley and many others
#    
#    	gnuplot home:     http://www.gnuplot.info
#    	faq, bugs, etc:   type "help FAQ"
#    	immediate help:   type "help"  (plot window: hit 'h')
set terminal epslatex   leveldefault color blacktext butt noclip nobackground \
                        palfuncparam 2000,0.003 standalone "" 11  fontscale 1.0 
unset key
set xlabel "Two-photon energy (eV)" 
set xlabel  font "" textcolor lt -1 norotate
set xtics 0.5
set xrange [ 2.5 : 5.0 ] noreverse nowriteback
set yrange [ -90 : 270 ] noreverse nowriteback
#set ytics 90
set ticslevel 0
set locale "en_US.UTF-8"
set pm3d map
load '3DReflectance/Spectral.plt'
set palette negative
unset grid
set size ratio 1

## varying theta, phi = 30
set ytics ('$-\frac{\pi}{2}$' -90, "0" 0, '$\frac{\pi}{2}$' 90, '$\pi$' 180, '$\frac{3\pi}{2}$' 270,)
set ylabel 'Angle of incidence $(\theta_{0})$' offset 1,0
set cbtics auto
set output 'fig-4_4_08.tex'
sp '../../data/Si1x1/3Dtheta.dat' u (2*$2):1:3 w image
unset ylabel
set ytics 90
set format y ' '
set cbtics 0.02
set output 'fig-4_4_09.tex'
sp '../../data/Si1x1/3Dtheta.dat' u (2*$2):1:5 w image

set ytics ('$-\frac{\pi}{2}$' -90, "0" 0, '$\frac{\pi}{2}$' 90, '$\pi$' 180, '$\frac{3\pi}{2}$' 270,)
set ylabel 'Angle of incidence $(\theta_{0})$' offset 1,0
set cbtics 0.1
set output 'fig-4_4_10.tex'
sp '../../data/Si1x1/3Dtheta.dat' u (2*$2):1:4 w image
unset ylabel
set ytics 90
set format y ' '
set cbtics 0.2
set output 'fig-4_4_11.tex'
sp '../../data/Si1x1/3Dtheta.dat' u (2*$2):1:6 w image



## varying phi, theta = 45
# set ylabel '$\phi$ (Degrees)' 
# set output 'fig-4_4_12.tex'
# sp '../../data/Si1x1/3Dphi.dat' u (2*$2):1:3 w image
# set output 'fig-4_4_13.tex' 
# set cbtics 0.1
# sp '../../data/Si1x1/3Dphi.dat' u (2*$2):1:4 w image
# set cbtics auto
# set output 'fig-4_4_14.tex'
# sp '../../data/Si1x1/3Dphi.dat' u (2*$2):1:5 w image
# set output 'fig-4_4_15.tex'
# sp '../../data/Si1x1/3Dphi.dat' u (2*$2):1:6 w image

#    EOF
