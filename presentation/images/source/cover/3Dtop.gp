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
# set terminal epslatex leveldefault color blacktext standalone "" 11 fontscale 1 size 11,8.5
set terminal pngcairo dashed nocrop enhanced size 1080,1080 font "Minion Pro,22"
set output '3Dtop.png'

# set view 0, 0, 1, 1
unset border
unset key
unset tics
unset colorbox

set xrange [-2.5:2.5]
set yrange [-2.5:2.5]
set urange [0:360]
set vrange [0:180]
set ticslevel 0

# line styles
set style line 1 lc rgb '#D53E4F' # red
set style line 2 lc rgb '#F46D43' # orange
set style line 3 lc rgb '#FDAE61' # pale orange
set style line 4 lc rgb '#FEE08B' # pale yellow-orange
set style line 5 lc rgb '#E6F598' # pale yellow-green
set style line 6 lc rgb '#ABDDA4' # pale green
set style line 7 lc rgb '#66C2A5' # green
set style line 8 lc rgb '#3288BD' # blue

# palette
set palette defined ( 0 '#D53E4F',\
                      1 '#D53E4F',\
                      2 '#D53E4F',\
                      3 '#D53E4F',\
                      4 '#F46D43',\
                      5 '#FDAE61',\
                      6 '#FEE08B',\
                      7 '#E6F598',\
                      8 '#ABDDA4',\
                      9 '#66C2A5',\
                     10 '#3288BD' )

set palette negative

set angles degrees
set mapping spherical
set parametric
set isosamples 200
# set pm3d depthorder
set hidden3d back
# set style fill transparent solid 0.65
set pm3d map hidden3d lw 0.1

# for grids
p1(phi) = 2.5*cos(phi)
p2(phi) = 2.5*sin(phi)
t1(r,theta) = r*cos(theta)
t2(r,theta) = r*sin(theta)

# phi grid
set arrow from 0,0,0 to p1(000),p2(000),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1( 45),p2( 45),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1( 90),p2( 90),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1(135),p2(135),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1(180),p2(180),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1(225),p2(225),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1(270),p2(270),0 nohead lw 1 dt 2 lc rgb 'black'
set arrow from 0,0,0 to p1(315),p2(315),0 nohead lw 1 dt 2 lc rgb 'black'
# angle labels
set label 'ϕ'    at 2.2,0.2,0 font ',30' front
set label '0'    at 2.6,0,0 front
set label 'π/4'  at 1.05*p1( 45),1.05*p2( 45),0
set label 'π/2'  at -0.1,2.6,0
set label '3π/4' at 1.10*p1(135),1.14*p2(135),0
set label 'π'    at -2.65,0.03,0
set label '5π/4' at 1.10*p1(225),1.10*p2(225),0
set label '3π/2' at -0.1,-2.6,0
set label '7π/4' at 1.05*p1(315),1.05*p2(315),0

# set arrow from 0,0,0 to p1(30),p2(30),0 nohead lw 1 dt 3
# set label 'π/6' at 1.15*p1(30),1.15*p2(30),0

# theta grid
# set arrow from t1(1.0, 45),0,t2(1.0, 45) to t1(2.5, 45),0,t2(2.5, 45) nohead lw 1 dt 2 lc rgb 'black' front
# set arrow from t1(0.0, 90),0,t2(0.0, 90) to t1(2.5, 90),0,t2(2.5, 90) nohead lw 1 dt 2 lc rgb 'black' back
# set arrow from t1(1.5,135),0,t2(1.5,135) to t1(2.5,135),0,t2(2.5,135) nohead lw 1 dt 2 lc rgb 'black' back
# # angle label
# set label 'θ'    at 0.90*t1(2.5, 90),-0.3,0.90*t2(2.5, 90) font ',30' front
# set label 'π/4'  at 1.05*t1(2.5, 45),-0.0,1.05*t2(2.5, 45) front
# set label 'π/2'  at 1.00*t1(2.5, 90),-0.1,1.08*t2(2.5, 90) front
# set label '3π/4' at 1.10*t1(2.5,135),-0.2,1.10*t2(2.5,135) front

# set arrow from 0,0,0 to t1(65),0,t2(65) nohead lw 1 dt 3
# set label '65' at 1.15*t1(65),0,1.15*t2(65)

# circle
fx(r,x) = r*cos(x)
fy(r,x) = r*sin(x)
fz(r,x) = 0

sp 'E1.dat' u 3:2:(1*$4) t '' w pm3d,\
fx(0.5,u),fy(0.5,u),fz(0.5,u) w l lw 1 lc rgb 'black',\
fx(1.5,u),fy(1.5,u),fz(1.5,u) w l lw 1 lc rgb 'black',\
fx(2.5,u),fy(2.5,u),fz(2.5,u) w l lw 1 lc rgb 'black'
# fx(0.5,v),fz(0.5,v),fy(0.5,v) w l lw 1 lc rgb 'black',\
# fx(1.5,v),fz(1.5,v),fy(1.5,v) w l lw 1 lc rgb 'black',\
# fx(2.5,v),fz(2.5,v),fy(2.5,v) w l lw 1 lc rgb 'black'
