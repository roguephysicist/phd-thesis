set term mp color dashed amstex magnification 1
set output 'metapost.mp'

abso(w,x,y,z)=(sqrt((w+y)**2+(x+z)**2))
esu2pm=(4*pi/3)*1e18*1e-6 # conversion and tiniba scaling
mitchellnorm=0.49 # (1e-20 cm^2/W) from mitchellSS01

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing Xxxx to hoferAPA96 exp (chis broadened by 0.05 eV gaussian)
set key at 2.8,0.96
set xrange [2:4]
set yrange [0:1]
set xtics 0.4
set ytics auto
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\vert\chi^{xxx}\vert$ ($10^{6}\times\mathrm{pm}^{2}$/V)}'
p "data/shgC.vnl.sm_0.05_xxx_576_half-slab_12-nospin_scissor_0.70_Nc_103" u (2*$1):(2*abso($2,$3,$4,$5)) t 'Relaxed ($\times2$)' w l lw 2 lc rgb "blue",\
  "data/shgC.vnl.sm_0.05_xxx_514_half-slab_12-nospin_scissor_0.70_Nc_103" u (2*$1):(2*abso($2,$3,$4,$5)) t 'Unrelaxed ($\times2$)' w l lw 2 dt 4 lc rgb "red",\
  "experiment/hoferAPA96.dat" u (2*$1):(esu2pm*$2) t 'Experiment' w lp pt 9 ps 1 lw 1.5 lc rgb "black"
####

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing RpS to Mejia exp (chis sig=0.05eV gaussian, r sig=0.10eV gaussian)
set key at 3.4,0.48
unset xlabel
set xrange [2.5:5]
set yrange [0:0.5]
set xtics auto
set ytics 0.1
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
p "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):3 t 'Three layer' w l lw 2.0 lc rgb "blue",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.2layer.dat" u (2*$1):($3*3) t 'Two layer ($\times 3$)' w l lw 1.0 lc rgb "red",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.case5.dat" u (2*$1):($3*3) t '\emph{Bulk} ($\times 3$)' w l dt 4 lw 2.5 lc rgb "dark-spring-green",\
  "experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($3/100) t 'Experiment' w p pt 2 ps 1 lw 1.0 lc rgb "black"
####

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing RpS to Mitchell exp (chis sig=0.05eV gaussian, r sig=0.10eV gaussian, theta = 45deg)
set key inside top left
set key at 2.65,1.16
set xrange [2.8:3.7]
set yrange [0:1.2]
set xtics 0.2
set ytics auto
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}' left offset 1,0,0
p "data/shgyield.vnl.theta_45_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):($3*2) t 'Three layer $(\times 2)$' w l lw 2 lc rgb "blue",\
  "data/shgyield.vnl.theta_45_phi_30_sm_0.10_scissor_0.70_Nc_103.2layer.dat" u (2*$1):($3*3) t 'Two layer $(\times 3)$' w l lw 1.0 lc rgb "red",\
  "data/shgyield.vnl.theta_45_phi_30_sm_0.10_scissor_0.70_Nc_103.case5.dat" u (2*$1):($3*3) t '\emph{Bulk} $(\times 3)$' w l dt 4 lw 2.5 lc rgb "dark-spring-green",\
  "experiment/mitchellSS01.dat" u 1:(mitchellnorm*$3) t 'Experiment' w p pt 9 ps 0.25 lw 1.0 lc rgb "black"
####

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing RpS improvements (chis sig=0.05eV gaussian, r sig=0.10eV gaussian)
set key at 1.0,0.39
unset xlabel
set xrange [2.5:5]
set yrange [0:0.4]
set xtics auto
set ytics 0.1
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
p "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):3 t 'Full' w l lw 2.5 lc rgb "blue",\
  "data/shgyield.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):3 t 'No $\boldsymbol{\mathcal{V}}^{\mathrm{nl}}$' w l dt 4 lw 2 lc rgb "red",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.00_Nc_103.3layer.dat" u (2*$1):3 t '$\hbar\Delta = 0$' w l lw 1 lc rgb "black"
####

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing RsP to Mejia exp (chis broadened by 0.05 eV gaussian, r broadened by 0.10)
set key at 2.1,0.095
unset xlabel
set xrange [2.5:5.0]
set yrange [0:0.1]
set xtics auto
set ytics auto
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\mathcal{R}_{sP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
p "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):4 t 'Three layer' w l lw 2 lc rgb "blue",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.2layer.dat" u (2*$1):($4/100) t 'Two layer ($\times 0.01$)' w l lw 1.0 lc rgb "red",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.case5.dat" u (2*$1):($4*10) t '\emph{Bulk} ($\times 10$)' w l dt 4 lw 2.5 lc rgb "dark-spring-green",\
  "experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($4/100) t 'Experiment' w p pt 2 ps 1 lw 1.0 lc rgb "black"
####

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing RpP to Mejia exp (chis broadened by 0.05 eV gaussian, r broadened by 0.10)
set key at 2.1,1.9
set xrange [2.5:5.0]
set yrange [0:2]
set xtics auto
set ytics auto
set xlabel '{\Large Two-photon energy (eV)}'
set ylabel '{\Large $\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
p "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):($2/2) t 'Three Layer ($\times 0.5$)' w l lw 2 lc rgb "blue",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.2layer.dat" u (2*$1):($2/40) t 'Two layer ($\times 1/40$)' w l lw 1.0 lc rgb "red",\
  "data/shgyield.vnl.theta_65_phi_30_sm_0.10_scissor_0.70_Nc_103.case5.dat" u (2*$1):($2*4) t '\emph{Bulk} ($\times 4$)' w l dt 4 lw 2.5 lc rgb "dark-spring-green",\
  "experiment/mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' w p pt 2 ps 1 lw 1.0 lc rgb "black"
####

unset label
unset key
unset xtics
unset ytics
unset x2tics
unset y2tics
unset ylabel
unset y2label
unset yrange
unset y2range
unset arrow
unset size
unset origin

## Comparing RpP to Mitchell exp (chis sig=0.05eV gaussian, r sig=0.10eV gaussian, theta = 45deg)
#set size 0.52,1
set key at 2.67,1.16
set xrange [2.8:3.7]
set yrange [0:1.2]
set xtics 0.2
set ytics auto
set ylabel '{\Large $\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}' left offset 1,0,0
p "data/shgyield.vnl.theta_45_phi_30_sm_0.10_scissor_0.70_Nc_103.3layer.dat" u (2*$1):2 t 'Three Layer' w l lw 2 lc rgb "blue",\
  "data/shgyield.vnl.theta_45_phi_30_sm_0.10_scissor_0.70_Nc_103.2layer.dat" u (2*$1):($2/20) t 'Two layer ($\times 1/20$)' w l lw 1.0 lc rgb "red",\
  "data/shgyield.vnl.theta_45_phi_30_sm_0.10_scissor_0.70_Nc_103.case5.dat" u (2*$1):($2*8) t '\emph{Bulk} ($\times 8$)' w l dt 4 lw 2.5 lc rgb "dark-spring-green",\
  "experiment/mitchellSS01.dat" u 1:(mitchellnorm*$2) t 'Experiment' w p pt 9 ps 0.25 lw 1.5 lc rgb "black"
####
