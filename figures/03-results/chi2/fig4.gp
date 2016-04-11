## metapost
#set term mp solid color  latex magnification 1
set term mp  color  latex magnification 1
set out 'fig.mp'
#
set multiplot
set size 1,.8
set xrange [0:5]
set yrange [0:1.6]
#
set ylabel "\\Large $|\\chi^{xxx}|$ (10$^6\\times$pm$^2$/V)" 
shg(w,x,y,z)=sqrt((w+y)**2+(x+z)**2)
scale=1.e6
f16=2645.886245/scale
f24=3704.240743/scale
f32=4815.512966/scale
f40=5873.867464/scale
#
set origin 0,3
set label 1 at 2.4,1.1 '\Large$\hbar\Delta=0\,\mathrm{eV}\,\mathrm{without}\,\,\mathbf{v}^\mathrm{nl}$' 
p  'shg-results/32layers/shgC.sm_xxx_244_half-slab_10-nospin_scissor_0.0_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 1 lw 1 t '\large half-slab',\
   'shg-results/32layers/shgL.sm_xxx_244_10-nospin_scissor_0.0_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 2 lw 2 t '\large full-slab'

set origin 0,2.25
set label 1 at 2.4,1.1 '\Large$\hbar\Delta=0\,\mathrm{eV}\,\mathrm{with}\,\,\mathbf{v}^\mathrm{nl}$' 
p  'shg-results/32layers/shgC.vnl.sm_xxx_244_half-slab_10-nospin_scissor_0.0_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 1 lw 1 t '\large half-slab',\
   'shg-results/32layers/shgL.vnl.sm_xxx_244_10-nospin_scissor_0.0_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 2 lw 2 t '\large full-slab'

set origin 0,1.5
set label 1 at 2.4,1.1 '\Large$\hbar\Delta=0.5\,\mathrm{eV}\,\,\mathrm{without}\,\,\mathbf{v}^\mathrm{nl}$' 
p  'shg-results/32layers/shgC.sm_xxx_244_half-slab_10-nospin_scissor_0.5_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 1 lw 1 t '\large half-slab',\
   'shg-results/32layers/shgL.sm_xxx_244_10-nospin_scissor_0.5_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 2 lw 2 t '\large full-slab'

set origin 0,.65
set size 1,.9
set xlabel "\\Large $\\hbar\\omega$ (eV)"
set label 1 at 2.4,1.1 '\Large$\hbar\Delta=0.5\,\mathrm{eV}\,\,\mathrm{with}\,\,\mathbf{v}^\mathrm{nl}$' 
p  'shg-results/32layers/shgC.vnl.sm_xxx_244_half-slab_10-nospin_scissor_0.5_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 1 lw 1 t '\large half-slab',\
   'shg-results/32layers/shgL.vnl.sm_xxx_244_10-nospin_scissor_0.5_Nc_130' u 1:(f32*shg($2,$3,$4,$5)) w l lt 2 lw 2 t '\large full-slab'

