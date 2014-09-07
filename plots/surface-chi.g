## metapost
set term mp solid color  latex magnification 1
set out 'fig.mp'
set multiplot
# set size 1.4,1.4
#
 set xrange [1:10]
 set yrange [0:1.2]
#
set origin 0,2
set label 1 "\\Large without $v^{\\mathrm{nl}}$" at 7,.6
set ylabel "\\Large Im[$\\chi_{xx}$]" 
p 'data/chi1.sm_xx_14_5-nospin_scissor_0_Nc_37' u 1:($3/2) t "full/2" w l lt 1 lw 8,\
  'data/calChi1.sm_xx_14_half-slab_5-nospin_scissor_0_Nc_37' u 1:3 t "half-slab" w l lt 2 lw 1,\
  'data/chi1.sm_xx_14_5-nospin_scissor_1_Nc_37' u 1:($3/2) t "full/2,$\\Sigma=1$ eV" w l lt 1 lw 8,\
  'data/calChi1.sm_xx_14_half-slab_5-nospin_scissor_1_Nc_37' u 1:3 t "half-slab,$\\Sigma=1$ eV" w l lt 2 lw 1

set origin 0,1
set label 1 "\\Large with $v^{\\mathrm{nl}}$" at 8,.6
 set xlabel "\\Large photon-energy (eV)"
p 'data/chi1-vnl.sm_xx_14_5-nospin_scissor_0_Nc_37' u 1:($3/2) t "full/2" w l lt 1 lw 8,\
  'data/calChi1-vnl.sm_xx_14_half-slab_5-nospin_scissor_0_Nc_37' u 1:3 t "half-slab" w l lt 2 lw 1,\
  'data/chi1-vnl.sm_xx_14_5-nospin_scissor_1_Nc_37' u 1:($3/2) t "full/2,$\\Sigma=1$ eV" w l lt 1 lw 8,\
  'data/calChi1-vnl.sm_xx_14_half-slab_5-nospin_scissor_1_Nc_37' u 1:3 t "half-slab,$\\Sigma=1$ eV" w l lt 2 lw 1
#
