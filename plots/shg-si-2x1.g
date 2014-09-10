## metapost
set term mp solid color  latex magnification 1
set out 'fig.mp'
set multiplot
set size .6,.8
#
set xrange [0:5]
set yrange [0:400]
#
set origin 0,2
set label 1 "$\\hbar\\Sigma=0$ NO-$v^{\\mathrm{nl}}$" at 2.5,250
set ylabel "\\Large $|\\chi_{xxx}|$ (pm/V)" 
abso(w,x,y,z)=sqrt((w+y)**2+(x+z)**2)
p 'data/si-2x1/shgL.sm_xxx_74_5-nospin_scissor_0_Nc_50' u 1:(abso($2,$3,$4,$5)) t "full-slab" w l lt 1,\
  'data/si-2x1/shgC.sm_xxx_74_half-slab_5-nospin_scissor_0_Nc_50' u 1:(abso($2,$3,$4,$5)) t "half-slab" w l lt 2

set origin .54,2
unset ylabel
set label 1 "$\\hbar\\Sigma=1$ NO-$v^{\\mathrm{nl}}$" at 2.5,250
p 'data/si-2x1/shgL.sm_xxx_74_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "full-slab" w l lt 1,\
  'data/si-2x1/shgC.sm_xxx_74_half-slab_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "half-slab" w l lt 2

set origin 0,1.25
#set label 1 "\\Large$\\hbar\\Sigma=1$ eV" at 2.5,800
set label 1 "$\\hbar\\Sigma=0$ $v^{\\mathrm{nl}}$" at 2.5,250
set ylabel "\\Large $|\\chi_{xxx}|$ (pm/V)" 
set xlabel "\\Large photon-energy (eV)"
p 'data/si-2x1/shgL.vnl.sm_xxx_74_5-nospin_scissor_0_Nc_50' u 1:(abso($2,$3,$4,$5)) t "full-slab" w l lt 1,\
  'data/si-2x1/shgC.vnl.sm_xxx_74_half-slab_5-nospin_scissor_0_Nc_50' u 1:(abso($2,$3,$4,$5)) t "half-slab" w l lt 2

set origin .54,1.25
#set label 1 "\\Large$\\hbar\\Sigma=1$ eV" at 2.5,800
set label 1 "$\\hbar\\Sigma=1$ $v^{\\mathrm{nl}}$" at 2.5,250
unset ylabel
set xlabel "\\Large photon-energy (eV)"
p 'data/si-2x1/shgL.vnl.sm_xxx_74_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "full-slab" w l lt 1,\
  'data/si-2x1/shgC.vnl.sm_xxx_74_half-slab_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "half-slab" w l lt 2

set origin 1.057,1.7
set size .4,.8
#set label 1 "\\Large$\\hbar\\Sigma=1$ eV" at 2.5,800
set label 1 "$\\hbar\\Sigma=1$ $v^{\\mathrm{nl}}$" at 2.5,90
unset ylabel
unset ytics
set auto
set xrange [:5]
set xlabel "\\Large photon-energy (eV)"
p 'data/si-2x1/shgC.vnl.sm_xxx_244_half-slab_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "\\tiny 244-k" w l lt 1,\
  'data/si-2x1/shgC.vnl.sm_xxx_130_half-slab_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "\\tiny 130-k" w l lt 2,\
  'data/si-2x1/shgC.vnl.sm_xxx_74_half-slab_5-nospin_scissor_1_Nc_50' u 1:(abso($2,$3,$4,$5)) t "\\tiny 74-k" w l lt 3

#
