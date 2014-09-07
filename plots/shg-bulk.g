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
 set ylabel "\\Large Im[$\\chi_{xyz}$] (pm/V)" 
p 'data/shgL.sm_xyz_47_10-nospin_scissor_0_Nc_16' u 1:($3+$5) t "L" w l lt 1 lw 8,\
  'data/shgV.sm_xyz_47_10-nospin_scissor_0_Nc_16' u 1:($3+$5) t "V" w l lt 2 lw 2,\
  'data/shgC.sm_xyz_47_1_10-nospin_scissor_0_Nc_16' u 1:($3+$5) every 4::1 t "layer" w p pt 2,\
  'data/shgL.vnl.sm_xyz_47_10-nospin_scissor_0_Nc_16' u 1:($3+$5) t "L@$v^{\\mathrm{nl}}$" w l lt 4 lw 1

set origin 0,1
set label 1 "\\Large$\\hbar\\Sigma=1$ eV" at 2.5,800
 set xlabel "\\Large photon-energy (eV)"
p 'data/shgL.sm_xyz_47_10-nospin_scissor_1_Nc_16' u 1:($3+$5) t "L" w l lt 1 lw 8,\
  'data/shgV.sm_xyz_47_10-nospin_scissor_1_Nc_16' u 1:($3+$5) t "V" w l lt 2 lw 1,\
  'data/shgC.sm_xyz_47_1_10-nospin_scissor_1_Nc_16' u 1:($3+$5) every 4::1 t "layer" w p pt 2,\
  'data/shgL.vnl.sm_xyz_47_10-nospin_scissor_1_Nc_16' u 1:($3+$5) t "L@$v^{\\mathrm{nl}}$" w l lt 4 lw 1
#
