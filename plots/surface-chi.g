## metapost
set term mp solid color  latex magnification 1
set out 'fig.mp'
set multiplot
# set size 1.4,1.4
#
 set xrange [0:5]
#
set origin 0,2
set label 1 "\\Large $\\hbar\\Sigma=0$" at 2.5,1000
 set ylabel "\\Large Im[$\\chi_{xx}$]" 
p 'data/chi1.sm_xx_14_5-nospin_scissor_0_Nc_37' u 1:($3/2) t "full/2" w l lt 1 lw 8,\
p 'data/calChi1.sm_xx_14_half-slab_5-nospin_scissor_0_Nc_37' u 1:3 t "half-slab" w l lt 2 lw 1


set origin 0,1
set label 1 "\\Large$\\hbar\\Sigma=1$ eV" at 2.5,800
 set xlabel "\\Large photon-energy (eV)"
p 'data/shgL.sm_zxy_47_10-nospin_scissor_1_Nc_16' u 1:($3+$5) t "L" w l lt 1 lw 8,\
  'data/shgV.sm_zxy_47_10-nospin_scissor_1_Nc_16' u 1:($3+$5) t "V" w l lt 2 lw 1,\
  'data/shgC.sm_zxy_47_1_10-nospin_scissor_1_Nc_16' u 1:($3+$5) every 4::1 t "layer" w p pt 2,\
  'data/shgL.vnl.sm_zxy_47_10-nospin_scissor_1_Nc_16' u 1:($3+$5) t "L@$v^{\\mathrm{nl}}$" w l lt 4 lw 1
#
