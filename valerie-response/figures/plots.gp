#!/usr/local/Cellar/gnuplot/5.0.1/bin/gnuplot -persist
#
#    
#    	G N U P L O T
#    	Version 5.0 patchlevel 1    last modified 2015-06-07 
#    
#    	Copyright (C) 1986-1993, 1998, 2004, 2007-2015
#    	Thomas Williams, Colin Kelley and many others
#    
#    	gnuplot home:     http://www.gnuplot.info
#    	faq, bugs, etc:   type "help FAQ"
#    	immediate help:   type "help"  (plot window: hit 'h')
set terminal epslatex    leveldefault color blacktext \
   dashlength 1.0 linewidth 1.0 butt noclip \
   nobackground \
   palfuncparam 2000,0.003 \
   standalone "" 11  fontscale 1.0 

set key title "" center
set key inside right top vertical Right noreverse enhanced autotitle nobox
set key noinvert samplen 4 spacing 1 width 0 height 0 

set style line 1  dashtype 1 linecolor rgb "#6c71c4"  linewidth 1.500 #violet
set style line 2  dashtype 1 linecolor rgb "#859900"  linewidth 2.000 #green
set style line 3  dashtype 1 linecolor rgb "#cb4b16"  linewidth 2.000 #orange
set style line 4  dashtype 1 linecolor rgb "#2aa198"  linewidth 2.000 #cyan
set style line 5  dashtype 1 linecolor rgb "#dc322f"  linewidth 2.000 #red
set style line 6  dashtype 1 linecolor rgb "#268bd2"  linewidth 2.000 #blue
set style line 7  dashtype 1 linecolor rgb "#d33682"  linewidth 2.000 #magenta
set style line 8  dashtype 1 linecolor rgb "#b58900"  linewidth 2.000 #yellow

set xlabel '{\Large Two-photon energy (eV)}'
set xrange [ 2.50000 : 5.00000 ] noreverse nowriteback

# set output "rpp-3vs2layer.tex"
# set yrange [ 0.00000 : 2.00000 ] noreverse nowriteback
# set ylabel '{\Large $\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
# p   "mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' w p ls 1,\
#     "2layer_sm0.10.dat" u ($1*2):($2/40) t '$\mathcal{P}(2\omega)$ in $v$, $\mathbf{E}(\omega)$ in $b$ (2 layer) $\times 1/40$' w l ls 2,\
#     "3layer_sm0.10.dat" u ($1*2):($2/20) t '$\mathcal{P}(2\omega)$ in $\ell$, $\mathbf{E}(\omega)$ in $\ell$ (3 layer) $\times 1/20$' w l ls 3

set output "rpp-comparison.tex"
set yrange [ 0.00000 : 2.00000 ] noreverse nowriteback
set ylabel '{\Large $\mathcal{R}_{pP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
p   "mejiaPRB02_bergfeldPRL04.dat" u 1:($2/100) t 'Experiment' w p ls 1,\
    "3layer_sm0.10.dat" u ($1*2):($7*5e-7) t '$\mathcal{P}(2\omega)$ in $v$, $\mathbf{E}(\omega)$ in $v$ (\textbf{Case 3}) $\times 5\mathrm{E}-7$' w l ls 3,\
    "3layer_sm0.10.dat" u ($1*2):($8*2e-6) t '$\mathcal{P}(2\omega)$ in $\ell$, $\mathbf{E}(\omega)$ in $b$ (\textbf{Case 4}) $\times 2\mathrm{E}-6$' w l ls 4,\
    "3layer_sm0.10.dat" u ($1*2):($6/2) t '$\mathcal{P}(2\omega)$ in $b$, $\mathbf{E}(\omega)$ in $b$ (\textbf{Case 5}) $\times 1/2$' w l ls 2

# set output "rps.tex"
# set yrange [ 0.00000 : 0.50000 ] noreverse nowriteback
# set ylabel '{\Large $\mathcal{R}_{pS}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
# p   "mejiaPRB02_bergfeldPRL04.dat" u 1:($3/100) t 'Experiment' w p ls 1,\
#     "2layer_sm0.10.dat" u ($1*2):($3*4) t '2 layer ($\times 4$)' w l ls 3,\
#     "3layer_sm0.10.dat" u ($1*2):($3/4) t '3 layer ($\times 1/4$)' w l ls 4

# set output "rsp.tex"
# set yrange [ 0.00000 : 0.10000 ] noreverse nowriteback
# set ylabel '{\Large $\mathcal{R}_{sP}\, (10^{-20} \times \mathrm{cm}^{2}/\mathrm{W})$}'
# p   "mejiaPRB02_bergfeldPRL04.dat" u 1:($4/100) t 'Experiment' w p ls 1,\
#     "2layer_sm0.10.dat" u ($1*2):($4/100) t '2 layer ($\times 1/100$)' w l ls 3,\
#     "3layer_sm0.10.dat" u ($1*2):($4/10) t '3 layer ($\times 1/10$)' w l ls 4
 
#    EOF
