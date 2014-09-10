## metapost
set term mp solid color  latex magnification 1
set out 'fig.mp'
set multiplot
#set size .6,.8
#
set xrange [0:5]
#
set origin 0,2
set label 1 "$\\hbar\\Sigma=0$ $v^{\\mathrm{nl}}$" at 2.5,140
set ylabel "\\Large $|\\chi_{xxx}|$ (pm/V)" 
set xlabel "\\Large photon-energy (eV)"
abso(w,x,y,z)=sqrt((w+y)**2+(x+z)**2)
p 'data/si-2x1/shgL.vnl.kk_xxx_244_5-nospin_scissor_0_Nc_50.brd' u 1:(abso($2,$3,$4,$5)) t "cio" w l lt 1,\
  'data/si-2x1/chi02_ipa.mdf' using 1:($13*24.429) w l t "x"


