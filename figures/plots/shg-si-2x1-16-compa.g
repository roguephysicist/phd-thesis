## metapost
set term mp solid color  latex magnification 1
set out 'fig.mp'
set size .6,.8
#
set xrange [0:5]
#set yrange [0:600]
#
set title "half-slab $\\hbar\\Sigma=.5$ $v^{\\mathrm{nl}}$" 
set ylabel "\\Large $|\\chi_{xxx}|$ (pm/V)" 
set xlabel "\\Large photon-energy (eV)"
abso(w,x,y,z)=sqrt((w+y)**2+(x+z)**2)
p 'data/si-2x1/last/gdcalS-calS/shgC.vnl.sm_xxx_244_half-slab_10-nospin_scissor_.5_Nc_66' u 1:(abso($2,$3,$4,$5)) t "full" w l,\
'data/si-2x1/last/only-calS/shgC.vnl.sm_xxx_244_half-slab_10-nospin_scissor_.5_Nc_66' u 1:(abso($2,$3,$4,$5)) t "only-${\\cal V}^{\\cal S}$" w l,\
'data/si-2x1/last/alternative/shgC.vnl.sm_xxx_244_half-slab_10-nospin_scissor_.5_Nc_66' u 1:(abso($2,$3,$4,$5)) t "alternative" w l,\
'data/si-2x1/last/gdcalS-calS/shgC.vnl.sm_xxx_244_half-slab_10-nospin_scissor_.5_Nc_65' u 1:(abso($2,$3,$4,$5)) t "full@2000" w l
#
