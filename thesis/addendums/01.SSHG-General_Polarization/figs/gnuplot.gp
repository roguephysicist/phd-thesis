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
set terminal epslatex standalone color size 3,6in
set locale "en_US.UTF-8"
set output 'comps60.tex'

FXXX = "chi2/SiH1x1-chi2-xxx"
FXYY = "chi2/SiH1x1-chi2-xyy"
FXXY = "chi2/SiH1x1-chi2-xxy"
FYXX = "chi2/SiH1x1-chi2-yxx"
FYYY = "chi2/SiH1x1-chi2-yyy"
FYXY = "chi2/SiH1x1-chi2-yxy"

ANG = 60
PHI = ANG*pi/180

XXX(n) = +(sin(PHI)**3 )*n
XYY(n) = +(sin(PHI)*cos(PHI)**2)*n
XXY(n) = -(2*sin(PHI)**2*cos(PHI))*n
YXX(n) = -(sin(PHI)**2*cos(PHI))*n
YYY(n) = -(cos(PHI)**3)*n
YXY(n) = +(2*sin(PHI)*cos(PHI)**2)*n

unset key

# set xlabel 'Photon Energy (eV)'
# set ylabel '$10^{6}$ pm$^{2}$/V'
set xrange [1:3]
set yrange [-0.4:0.4]
set ytics 0.2

set multiplot layout 3,1

set title 'Im$[\chi^{xxx}]\cdot \sin^{3}\Phi$'
p FXXX u 1:(XXX($3+$5)) w l t 'Im[$\chi^{xxx}$]' lw 3 lc rgb 'red'

set title 'Im$[\chi^{xyy}]\cdot \sin\Phi \cos^{2}\Phi$'
p FXYY u 1:(XYY($3+$5)) w l t 'Im[$\chi^{xyy}$]' lw 3 lc rgb 'red'

# set title 'Im$[\chi^{xxy}]\cdot -2\sin^{2}\Phi \cos\Phi$'
# p FXXY u 1:(XXY($3+$5)) w l t 'Im[$\chi^{xxy}$]' lw 3 lc rgb 'red'

# set title 'Im$[\chi^{yxx}]\cdot -\sin^{2}\Phi \cos\Phi$'
# p FYXX u 1:(YXX($3+$5)) w l t 'Im[$\chi^{yxx}$]' lw 3 lc rgb 'red'

# set title 'Im$[\chi^{yyy}]\cdot -\cos^{3}\Phi$'
# p FYYY u 1:(YYY($3+$5)) w l t 'Im[$\chi^{yyy}$]' lw 3 lc rgb 'red'

set title 'Im$[\chi^{yxy}]\cdot 2\sin\Phi \cos^{2}\Phi$'
p FYXY u 1:(YXY($3+$5)) w l t 'Im[$\chi^{yxy}$]' lw 3 lc rgb 'red'

unset multiplot



