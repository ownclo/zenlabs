set terminal pdf enhanced
set output "OUT_NAME.pdf"

set xlabel "X_LABEL" font "default, 6"
set ylabel "Y_LABEL" font "default, 6"

set key font "default, 5.75"
set tics font "default, 5"

set grid

set style line 1 lt 1 lw 1 lc rgb "black"
set style line 2 lt 1 lw 2 lc rgb "blue"
set style line 3 lt 1 lw 2 lc rgb "#006400"
set style line 4 lt 1 lw 2 lc rgb "red"

plot "./INP_NAME.dat"\
            ind 1 u 1:2  w p pt 2 ps 0.7 lc rgb "black" notitle,\
	   	 "" ind 2 u 1:2:(r) title "PLOT_NAME" ls 4 s acs
            #f(x) title "PLOT_NAME" ls 1


### THERE IS SOME USEFUL TIPS CONCERNING GNUPLOT
## CONTROLLING SIZES
#set terminal pdf enhanced size 6,5

## SPECIAL SYMBOLS
#{/Symbol a}

## MINOR TICS
#set mytics 10
#set mxtics 10

## FITTING CURVES
#f(x) = a*x + b
#fit f(x) './INP_NAME.dat' ind 1 via a,b
