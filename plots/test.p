set term epslatex  size 9.0cm,7.0cm
set out 'test.tex'
set xrange [0:6.0]
set lmargin 0.5
set rmargin 1
set bmargin 1
set tmargin 1


set xlabel 'Energy (eV)'
set ylabel '$\chi^{(2)}_{xxx} [pm/V]$'

plot 'SHG_Bernardo/shgL.vnl.kk_xxx_244_5-nospin_scissor_0_Nc_50.brd' using 1:(sqrt(($3+$5)**2+($2+$4)**2)) w l lc rgb 'red' title 'Bernardo' ,\
     'SHG_Nicolas/chi02_ipa.mdf' using 1:($13*24.429) w l  lc rgb 'black' title 'Nicolas'

