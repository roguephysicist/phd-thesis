#!/bin/bash

latex () {
    
    pdflatex shg-frame`printf "%03d\n" $i`.tex
    rm *.aux *.log
    rm shg-frame`printf "%03d\n" $i`.tex

}

incoming_beam () {

echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pagestyle{empty}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% INCOMING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};

    %%%% STRUCTURE FOR INC    \addplot[domain=7.9:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};    \addplot[domain=7.9:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};    \addplot[domain=7.9:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};IDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

latex

range=-24.
div=`echo "- $range/$1" | bc -l`

for (( i = 1; i <= $1+1; i++ )); do

step1=`echo "$range + $div*($i-1)" | bc -l`


echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pagestyle{empty}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% INCOMING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};


    %%%% STRUCTURE FOR INCIDENCE  \draw [white,thick,rotate around={20:(0,0)},->] (7.9,0) -- (8*pi,0);    \draw [white,thick,rotate around={20:(0,0)},->] (7.9,0) -- (8*pi,0);    \draw [white,thick,rotate around={20:(0,0)},->] (7.9,0) -- (8*pi,0);
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};

    %%%% INCOMING RED BEAM FROM -7*pi TO 0*pi
    \addplot[domain=-8*pi:$step1,samples=200,red,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \draw [red,thick,rotate around={-20:(0,0)},->] (-8*pi,0) -- ($step1,0);
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};
    


\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

latex

done

parse=$i
echo $parse

}


################################################################################


wave_transition () {


step1=1     ### used to vanish a draw
step2=0     ### used to apear a draw

for (( i = $parse; i < $parse+$1; i++ )); do


echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% BANISHING RED BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};


    %%%% STRUCTURE FOR INCIDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue]    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2}; graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};

    %%%% BANISHING BEAM FROM -7*pi TO 0*pi
    \addplot[domain=-8*pi:0,samples=200,red,thick,rotate around={-20:(0,0)},opacity=$step1]{0.5*sin(deg(x/2))};
    \draw [red,thick,rotate around={-20:(0,0)},->,opacity=$step1] (-8*pi,0) -- (0,0);
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};

    %%%% APPEARING ARROW AT 0,0
    \draw [blue,thick,rotate around={20:(0,0)},->,opacity=$step2] (0,0) -- (0.01,0);
\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

step1=`echo "$step1-1.5/$1" | bc -l` ### used to vanish a draw
step2=`echo "$step2+1.5/$1" | bc -l` ### used to show a draw


latex

done

parse=$i

}



# ################################################################################


outgoing_beam () {

step1=0.01
step2=0.01
counter=0

range=25.13
div=`echo "$range/$1" | bc -l`


for (( i = $parse; i <= $parse+$1; i++ )); do


echo "i=$i"
echo "div=$div"
echo "step1=$step1"

echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% OUTGOING BLUE BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};


    %%%% STRUCTURE FOR INCIDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% OUTGOING BEAM FROM 0,0
    \addplot[domain=0:$step1,samples=200,blue,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [blue,thick,rotate around={20:(0,0)},->] (0,0) -- ($step1,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};

\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex

step1=`echo "$step1 + $div" | bc -l`

latex

done

parse=$i

}


outgoing_desapearing_beam () {

step1=0
step2=0.01
counter=0

range=25.13
div=`echo "$range/$1" | bc -l`


for (( i = $parse; i < $parse+$1-1; i++ )); do


echo "i=$i"
echo "div=$div"
echo "step1=$step1"

step1=`echo "$step1 + $div" | bc -l`


echo "\documentclass{article}
\usepackage{amsmath}
\usepackage{pgfplots}
\usetikzlibrary{3d,calc}
\usepackage[paperwidth=2.9in,paperheight=1.9in,margin=0in]{geometry}

\pgfplotsset{compat=1.12}
\begin{document}

%%%% OUTGOING BLUE BEAM
\begin{tikzpicture}
    \begin{axis}[hide axis][]

    %%%% Trash code
    \addplot[domain=-8*pi:-8.01,samples=200,white,thick,rotate around={-20:(0,0)}]{0.5*sin(deg(x/2))};
    \addplot[domain=-6.5*pi:-6.4*pi,mark=none, white, samples=2] {2.3};    
    \addplot[domain=7.99*pi:8*pi,samples=200,white,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [white,thick,rotate around={20:(0,0)},->] (7.99*pi,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};


    %%%% STRUCTURE FOR INCIDENCE
    \addplot[thick,blue] graphics[xmin=-16.5,ymin=-1.3 ,xmax=23.5,ymax=1.25 ] {grapha};
    % \addplot[thick,blue] graphics[xmin=-10,ymin=-1.7 ,xmax=10,ymax=0.3] {cube};


    %%%% OUTGOING BEAM FROM 0,0
    \addplot[domain=$step1:8*pi,samples=200,blue,thick,rotate around={20:(0,0)}]{0.5*sin(deg(x))};
    \draw [blue,thick,rotate around={20:(0,0)},-] ($step1,0) -- (8*pi,0);
    \addplot[domain=-0.1:0.1,mark=none, white, samples=2] {1.2};

\end{axis}
\end{tikzpicture}


\end{document}" >> shg-frame`printf "%03d\n" $i`.tex


latex

done

parse=$i


}

################################################################################


incoming_beam 28            # Genera 2 figuras  mas que las indicadas, 
                            # incluyendo la 000 que es solo la estructura

wave_transition 0           # Genera el mismo numero de figuras que la entrada
                            # OPCIONAL: Usar "0" o al menos "3" como entrada. 
                            # Produce una trancision evanecente entre 1omega y 2 omega.
                            
outgoing_beam 14             # Genera el mismo numero de figuras que la entrada

outgoing_desapearing_beam 15 # Genera una figura menos que las indicadas




