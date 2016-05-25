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
set xtics 1
set xrange [ 0.5 : 4.5 ] noreverse nowriteback
set yrange [ -90 : 270 ] noreverse nowriteback
#set ytics 90
set ticslevel 0
set locale "en_US.UTF-8"
set pm3d map
load '3DReflectance/Spectral.plt'
set palette negative
unset grid
set size ratio 1

## varying theta, phi = 45
# set ytics ('$-\frac{\pi}{2}$' -90, "0" 0, '$\frac{\pi}{2}$' 90, '$\pi$' 180, '$\frac{3\pi}{2}$' 270,)
set ytics 90
set ylabel 'Angle of incidence $\theta_{0}$ ($^{\circ}$)' offset -0.5,0
set cblabel '$\mathcal{R}_{pP}\,(10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$' offset 1,0
set cbtics 4.0
set output 'fig-4_2_01.tex'
sp '../../data/Si2x1/3Dtheta.dat' u (2*$2):1:3 w image
set cblabel '$\mathcal{R}_{sP}\,(10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$' offset 1,0
set cbtics 1.0
set output 'fig-4_2_02.tex'
sp '../../data/Si2x1/3Dtheta.dat' u (2*$2):1:5 w image

# set ytics ('$-\frac{\pi}{2}$' -90, "0" 0, '$\frac{\pi}{2}$' 90, '$\pi$' 180, '$\frac{3\pi}{2}$' 270,)
set ytics 90
set ylabel 'Angle of incidence $\theta_{0}$ ($^{\circ}$)' offset -0.5,0
set cblabel '$\mathcal{R}_{pS}\,(10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$' offset 1,0
set cbtics 1.0
set output 'fig-4_2_03.tex'
sp '../../data/Si2x1/3Dtheta.dat' u (2*$2):1:4 w image
set cblabel '$\mathcal{R}_{sS}\,(10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$' offset 1,0
set cbtics 1.0
set output 'fig-4_2_04.tex'
sp '../../data/Si2x1/3Dtheta.dat' u (2*$2):1:6 w image


## varying phi, theta = 30
# set ylabel '$\phi$ (Degrees)' 
# set output 'fig-4_2_05.tex'
# sp '../../data/Si2x1/3Dphi.dat' u (2*$2):1:3 w image
# set output 'fig-4_2_06.tex'
# sp '../../data/Si2x1/3Dphi.dat' u (2*$2):1:4 w image
# set output 'fig-4_2_07.tex'
# sp '../../data/Si2x1/3Dphi.dat' u (2*$2):1:5 w image
# set output 'fig-4_2_08.tex'
# sp '../../data/Si2x1/3Dphi.dat' u (2*$2):1:6 w image

#    EOF
