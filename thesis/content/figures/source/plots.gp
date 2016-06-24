
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
set terminal epslatex leveldefault color blacktext standalone "" 11 fontscale 1  size 5,3

set border lw 2
set zero 1e-08
set locale "en_US.UTF-8"

scale=1.e6
f16=2698.8039699/scale
f24=4074.6648173/scale
f32=5397.6079398/scale
f40=6773.4687872/scale
abso(w,x,y,z)=(sqrt((w+y)**2+(x+z)**2))
esu2pm=(4*pi/3)*1e18*1e-6 # conversion and tiniba scaling
mitchellnorm=0.49 # (1e-20 cm^2/W) from mitchellSS01


## Si2x1: layer convergence
set output 'fig-Si2x1-layerconv.tex'
set key right top
set xrange [ 0 : 5 ] noreverse nowriteback
set yrange [ 0 : 1.6 ] noreverse nowriteback
set ytics 0.4
set xlabel 'One-photon energy (eV)'
set ylabel '$\vert\chi^{xxx}_{\mathrm{full-slab}}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)'
# set label 1 at 2.0,0.95 'w/o $\mathbf{v}^{\mathrm{nl}}$ and $\hbar\Delta = 0$ eV'
p '../../data/Si2x1/16layers/shgL.sm_0.15_xxx_244_10-nospin_scissor_0.00_Nc_66'  u 1:(f16*abso($2,$3,$4,$5)) t '16 layers' dt 2 lw 3.0 lc rgb "#1ba362" w l,\
  '../../data/Si2x1/24layers/shgL.sm_0.15_xxx_244_10-nospin_scissor_0.00_Nc_98'  u 1:(f24*abso($2,$3,$4,$5)) t '24 layers' dt 4 lw 3.0 lc rgb "#e6ac00" w l,\
  '../../data/Si2x1/32layers/shgL.sm_0.15_xxx_244_10-nospin_scissor_0.00_Nc_130' u 1:(f32*abso($2,$3,$4,$5)) t '32 layers' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  '../../data/Si2x1/40layers/shgL.sm_0.15_xxx_244_10-nospin_scissor_0.00_Nc_162' u 1:(f40*abso($2,$3,$4,$5)) t '40 layers' dt 1 lw 3.0 lc rgb "#dc322f" w l
####

unset label

## Si2x1: vnl vs no vnl
set output 'fig-Si2x1-vnl.tex'
set key right top
set xrange [ 0 : 5 ] noreverse nowriteback
set yrange [ 0 : 1.0 ] noreverse nowriteback
set ytics auto
set xlabel 'One-photon energy (eV)'
set ylabel '$\vert\chi^{xxx}_{\mathrm{half-slab}}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)'
# set label 1 at 3.45,0.7 '$\hbar\Delta=0.5$ eV'
p  '../../data/Si2x1/32layers/shgC.vnl.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130' u 1:(abso($2,$3,$4,$5)) t 'with $\mathbf{v}^\mathrm{nl}$' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
   '../../data/Si2x1/32layers/shgC.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130'     u 1:(abso($2,$3,$4,$5)) t 'w/o $\mathbf{v}^\mathrm{nl}$'  dt 2 lw 4.0 lc rgb "#dc322f" w l
####

unset label

## Si2x1: top vs bottom
set output 'fig-Si2x1-topvbottom.tex'
set key right top
set xrange [ 0 : 5 ] noreverse nowriteback
set yrange [ 0 : 1.4 ] noreverse nowriteback
set ytics auto
set xlabel 'One-photon energy (eV)'
set ylabel '$\vert\chi^{xxx}_{\mathrm{half-slab}}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)'
# set label 1 at 3.45,0.7 '$\hbar\Delta=0.5$ eV'
p  '../../data/Si2x1/32layers/shgC.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130'             u 1:(abso($2,$3,$4,$5)) t '2$\times$1 clean surface' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
   '../../data/Si2x1/32layers/shgC.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130_DiH_surface' u 1:(abso($2,$3,$4,$5)) t 'H-terminated surface'     dt 2 lw 4.0 lc rgb "#dc322f" w l
####

unset label

## Si2x1: different scissors values
set output 'fig-Si2x1-scissors.tex'
set key right top
set xrange [ 0 : 5 ] noreverse nowriteback
set yrange [ 0 : 1.2 ] noreverse nowriteback
set xlabel 'One-photon energy (eV)'
set ylabel '$\vert\chi^{xxx}_{2\times1}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)'
set label 1 at 3.45,.6 'with $\mathbf{v}^\mathrm{nl}$'
p '../../data/Si2x1/32layers/shgC.vnl.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.00_Nc_130' u 1:(abso($2,$3,$4,$5)) t '$\hbar\Delta=0.00$ eV' dt 4 lw 4.0 lc rgb "#1ba362" w l,\
  '../../data/Si2x1/32layers/shgC.vnl.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130' u 1:(abso($2,$3,$4,$5)) t '$\hbar\Delta=0.50$ eV' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  '../../data/Si2x1/32layers/shgC.vnl.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.63_Nc_130' u 1:(abso($2,$3,$4,$5)) t '$\hbar\Delta=0.63$ eV' dt 1 lw 3.0 lc rgb "#dc322f" w l
####

unset label

## Si1x1: comparing Xxxx to hoferAPA96
set output 'fig-Si1x1-Hofer_Xxxx.tex'
set key at 2.85,0.775
set xrange [2.2:3.6]
set yrange [0:0.8]
set xtics 0.2
set ytics 0.2
set xlabel 'Two-photon energy (eV)'
set ylabel '$\vert\chi^{xxx}_{\mathrm{surface}}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)'
set linestyle 1 pt 7 ps 1 lw 3 lc rgb "black"
p "../../data/Si1x1/shgC.vnl.sm_0.075_xxx_576_half-slab_12-nospin_scissor_0.70_Nc_103" u (2*$1):(2*abso($2,$3,$4,$5)) t 'Relaxed ($\times2$)'   dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/shgC.vnl.sm_0.075_xxx_514_half-slab_12-nospin_scissor_0.70_Nc_103" u (2*$1):(2*abso($2,$3,$4,$5)) t 'Unrelaxed ($\times2$)' dt 4 lw 3.0 lc rgb "#dc322f" w l,\
  "../../data/experiment/hoferAPA96.dat" u (2*$1):(esu2pm*$2) t '' pt 7 ps 1 lw 3 lc rgb "black" w p,\
  "../../data/experiment/hoferAPA96.dat" u (2*$1):(esu2pm*$2) smooth mcsplines t '' lw 3 lc rgb "black" w l,\
  0/0 t "Experiment" ls 1 w lp 
####


## Si1x1: comparing RpS to Mejia
set output 'fig-Si1x1-Mejia_RpS.tex'
set key at 3.75,0.49
set xrange [2.5:5]
set yrange [0:0.5]
set xtics auto
set ytics 0.1
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):3      t '3-layer'                      dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-fresnel.dat"     u (2*$1):($3*3) t '2-layer-fresnel ($\times 3$)' dt 1 lw 2.0 lc rgb "#dc322f" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-bulk.dat"        u (2*$1):($3*3) t '2-layer-bulk ($\times 3$)'    dt 3 lw 4.0 lc rgb "#1ba362" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($3/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si1x1: comparing RpS to Mitchell
set output 'fig-Si1x1-Mitchell_RpS.tex'
set key at 3.27,1.18 Right
set xrange [2.8:3.7]
set yrange [0:1.2]
set xtics 0.2
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mitchell.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($3*1.8) t '3-layer ($\times 1.8$)'       dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mitchell.vnl.scissor0.70.2-layer-fresnel.dat"     u (2*$1):($3*6)   t '2-layer-fresnel ($\times 6$)' dt 1 lw 2.0 lc rgb "#dc322f" w l,\
  "../../data/Si1x1/Rif-Mitchell.vnl.scissor0.70.2-layer-bulk.dat"        u (2*$1):($3*6)   t '2-layer-bulk ($\times 6$)'    dt 3 lw 4.0 lc rgb "#1ba362" w l,\
  "../../data/experiment/mitchellSS01.dat" u 1:(mitchellnorm*$3) t 'Experiment' pt 7 ps 0.5 lw 1.0 lc rgb "black" w p
####


## Si1x1: RpS improvements
set output 'fig-Si1x1-Mejia_RpS_improvements.tex'
set key at 3.3,0.48
set xrange [2.5:5]
set yrange [0:0.5]
set xtics auto
set ytics 0.1
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($3*0.9) t 'Full'                             dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.scissor0.70.3-layer.dat"     u (2*$1):($3*0.9) t 'w/o ${\mathbf{v}}^{\mathrm{nl}}$' dt 4 lw 3.0 lc rgb "#dc322f" w l,\
  "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.00.3-layer.dat" u (2*$1):($3*0.9) t '$\hbar\Delta = 0$'                dt 2 lw 4.0 lc rgb "#1ba362" w l
####


## Si1x1: comparing RsP to Mejia
set output 'fig-Si1x1-Mejia_RsP.tex'
set key at 3.9,0.098
set xrange [2.5:5.0]
set yrange [0:0.1]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{sP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):4         t '3-layer'                         dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-fresnel.dat"     u (2*$1):($4*0.01) t '2-layer-fresnel ($\times 0.01$)' dt 4 lw 4.0 lc rgb "#dc322f" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-bulk.dat"        u (2*$1):($4*10)   t '2-layer-bulk ($\times 10$)'      dt 2 lw 4.0 lc rgb "#1ba362" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($4/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si1x1: comparing RpP to Mejia
set output 'fig-Si1x1-Mejia_RpP.tex'
set key at 3.9,1.95
set xrange [2.5:5.0]
set yrange [0:2]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.5)   t '3-layer ($\times 0.5$)'           dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.3-layer-hybrid.dat"      u (2*$1):($2*2)     t '3-layer-hybrid ($\times 2$)'      dt 4 lw 4.0 lc rgb "#e6ac00" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-bulk.dat"        u (2*$1):($2*4)     t '2-layer-bulk ($\times 4$)'        dt 2 lw 4.0 lc rgb "#1ba362" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si1x1: comparing RpP to Mitchell
#set size 0.52,1
set output 'fig-Si1x1-Mitchell_RpP.tex'
set key at 3.3,1.18
set xrange [2.8:3.7]
set yrange [0:1.2]
set xtics 0.2
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mitchell.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.8)  t '3-layer ($\times 0.8$)'          dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mitchell.vnl.scissor0.70.2-layer-fresnel.dat"     u (2*$1):($2*0.05) t '2-layer-fresnel ($\times 0.05$)' dt 4 lw 4.0 lc rgb "#dc322f" w l,\
  "../../data/Si1x1/Rif-Mitchell.vnl.scissor0.70.2-layer-bulk.dat"        u (2*$1):($2*8)    t '2-layer-bulk ($\times 8$)'       dt 2 lw 4.0 lc rgb "#1ba362" w l,\
  "../../data/experiment/mitchellSS01.dat" u 1:(mitchellnorm*$2) t 'Experiment' pt 7 ps 0.5 lw 1.5 lc rgb "black" w p
####


## Si1x1: comparing RpP models to Mejia
set output 'fig-Si1x1-Mejia_RpP_models.tex'
set key at 4.1,1.95
set xrange [2.5:5.0]
set yrange [0:2]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-fresnel.dat"     u (2*$1):($2*0.025) t '2-layer-fresnel ($\times 0.025$)' dt 1 lw 4.0 lc rgb "#1ba362" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.2-layer-vacuum.dat" u (2*$1):($2*2.5e-5) t '2-layer-vacuum ($\times 2.5\mathrm{E}-5$)' dt 2 lw 4.0 lc rgb "#dc322f" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si1x1 MR: vary d keeping d2 avg
set output 'fig-Si1x1-MRthickness.tex'
set key at 3.6,1.95
set xrange [2.5:5.0]
set yrange [0:2]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.avg_05nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.5) t '$d = 5\,\mathrm{nm}$ ($\times 0.5$)'  dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.5) t '$d = 10\,\mathrm{nm}$ ($\times 0.5$)' dt 2 lw 3.0 lc rgb "#1ba362" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.3-layer.dat"             u (2*$1):($2*0.5) t 'w/o MR ($\times 0.5$)'                dt 4 lw 3.0 lc rgb "#dc322f" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si1x1 MR: linear contribution to MR
set output 'fig-Si1x1-MRno1w.tex'
set key at 3.65,1.95
set xrange [2.5:5.0]
set yrange [0:2]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat"      u (2*$1):($2*0.5) t 'with $r^{M}$ ($\times 0.5$)' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.MR_no1w.avg_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.5) t 'w/o $r^{M}$ ($\times 0.5$)'  dt 4 lw 3.0 lc rgb "#dc322f" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si1x1 MR: vary d2 keeping d=10nm
set output 'fig-Si1x1-MRdepth.tex'
set key at 3.65,1.95
set xrange [2.5:5.0]
set yrange [0:2]
set xtics auto
set ytics auto
set xlabel 'Two-photon energy (eV)'
set ylabel '$\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$'
p "../../data/Si1x1/Rif-Mejia.MR.00nm_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.5) t '$d_{2} = 0\,\mathrm{nm}$ ($\times 0.5$)'  dt 2 lw 3.0 lc rgb "#1ba362" w l,\
  "../../data/Si1x1/Rif-Mejia.MR.10nm_10nm.vnl.scissor0.70.3-layer.dat" u (2*$1):($2*0.5) t '$d_{2} = 10\,\mathrm{nm}$ ($\times 0.5$)' dt 3 lw 3.0 lc rgb "#e6ac00" w l,\
  "../../data/Si1x1/Rif-Mejia.MR.avg_10nm.vnl.scissor0.70.3-layer.dat"  u (2*$1):($2*0.5) t 'Average ($\times 0.5$)'                   dt 1 lw 4.0 lc rgb "#268bd2" w l,\
  "../../data/Si1x1/Rif-Mejia.vnl.scissor0.70.3-layer.dat"              u (2*$1):($2*0.5) t 'w/o MR ($\times 0.5$)'                    dt 4 lw 3.0 lc rgb "#dc322f" w l,\
  "../../data/experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' pt 1 ps 1 lw 2 lc rgb "black" w p
####


## Si2x1: half-slab vs full-slab multiplot
set terminal epslatex leveldefault color blacktext standalone "" 11 fontscale 1 size 6,3.5
set output 'fig-Si2x1-hsvsfs.tex'
set border lw 2
set multiplot layout 2,2
set xrange [ 0 : 5 ] noreverse nowriteback
set yrange [ 0 : 1.5 ] noreverse nowriteback
set ytics 0.5

TOP = 0.96
LEFT = 0.13
DIV = 0.39
DIV2 = 0.42

unset key
set tmargin at screen TOP
set bmargin at screen TOP-DIV
set lmargin at screen LEFT
set rmargin at screen LEFT+DIV2
set format x ''
unset format y
unset ylabel
unset xlabel
set label 1 at 3.4,0.7 '{\scriptsize $\hbar\Delta=0$ eV, w/o $\mathbf{v}^\mathrm{nl}$}' 
p  '../../data/Si2x1/32layers/shgC.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.00_Nc_130' u 1:(abso($2,$3,$4,$5))     t 'half-slab' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
   '../../data/Si2x1/32layers/shgL.sm_0.15_xxx_244_10-nospin_scissor_0.00_Nc_130'           u 1:(f32*abso($2,$3,$4,$5)) t 'full-slab' dt 4 lw 4.0 lc rgb "#dc322f" w l

set key at 4.9,1.35
set key Left width -8
set tmargin at screen TOP
set bmargin at screen TOP-DIV
set lmargin at screen LEFT+DIV2
set rmargin at screen LEFT+2*DIV2
set format x ''
set format y ''
unset ylabel
unset xlabel
set label 1 at 3.4,0.7 '{\scriptsize $\hbar\Delta=0$ eV, with $\mathbf{v}^\mathrm{nl}$}' 
p  '../../data/Si2x1/32layers/shgC.vnl.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.00_Nc_130' u 1:(abso($2,$3,$4,$5))     t '{\small half-slab}' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
   '../../data/Si2x1/32layers/shgL.vnl.sm_0.15_xxx_244_10-nospin_scissor_0.00_Nc_130'           u 1:(f32*abso($2,$3,$4,$5)) t '{\small full-slab}' dt 4 lw 4.0 lc rgb "#dc322f" w l

unset key
set tmargin at screen TOP-DIV
set bmargin at screen TOP-2*DIV
set lmargin at screen LEFT
set rmargin at screen LEFT+DIV2
unset format x
unset format y
set ytics add ('' 1.5)
set xtics add ('' 5)
set ylabel '$\vert\chi^{xxx}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)' offset 0,4,0
set xlabel 'One-photon energy (eV)' offset 12,0,0
set label 1 at 3.5,0.7 '{\scriptsize $\hbar\Delta=0.5$ eV, w/o $\mathbf{v}^\mathrm{nl}$}' 
p  '../../data/Si2x1/32layers/shgC.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130' u 1:(abso($2,$3,$4,$5))     t 'half-slab' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
   '../../data/Si2x1/32layers/shgL.sm_0.15_xxx_244_10-nospin_scissor_0.50_Nc_130'           u 1:(f32*abso($2,$3,$4,$5)) t 'full-slab' dt 4 lw 4.0 lc rgb "#dc322f" w l

unset key
set tmargin at screen TOP-DIV
set bmargin at screen TOP-2*DIV
set lmargin at screen LEFT+DIV2
set rmargin at screen LEFT+2*DIV2
unset format x
set format y ''
set xtics auto
unset ylabel
unset xlabel
set label 1 at 3.5,0.7 '{\scriptsize $\hbar\Delta=0.5$ eV, with $\mathbf{v}^\mathrm{nl}$}' 
p  '../../data/Si2x1/32layers/shgC.vnl.sm_0.15_xxx_244_half-slab_10-nospin_scissor_0.50_Nc_130' u 1:(abso($2,$3,$4,$5))     t 'half-slab' dt 1 lw 4.0 lc rgb "#268bd2" w l,\
   '../../data/Si2x1/32layers/shgL.vnl.sm_0.15_xxx_244_10-nospin_scissor_0.50_Nc_130'           u 1:(f32*abso($2,$3,$4,$5)) t 'full-slab' dt 4 lw 4.0 lc rgb "#dc322f" w l 
unset multiplot
####

#    EOF
