#!/bin/bash
infile="Si2x1.in"
mode="theta"

if [ $mode == "theta" ]; then
    outfile="Rif-3Dtheta.dat"
elif [ $mode == "phi" ]; then
    outfile="Rif-3Dphi.dat"
fi

if [ -e $outfile ]; then
    rm -rf $outfile
fi

for num in $(seq -f "%03g" -90 01 90); do
    if [ $mode == "theta" ]; then
        output="theta${num}.dat"
        sed -i '' -e "3s/.*/theta: ${num}/" -e "33s/.*/output: ${output}/" ${infile}
    elif [ $mode == "phi" ]; then
        output="phi${num}.dat"
        sed -i '' -e "4s/.*/phi: ${num}/" -e "33s/.*/output: ${output}/" ${infile}
    fi
    /Users/sma/anaconda/bin/python shgyield.py ${infile}
    tail -n +3 ${output} > ${output}.tmp && mv ${output}.tmp ${output}
    awk -v value=${num} '{printf "%03d  %s  %s  %s  %s  %s\n", value,$1,$2,$3,$4,$5}' ${output} >> ${outfile}
    echo "" >> ${outfile}
    rm ${output}
done

