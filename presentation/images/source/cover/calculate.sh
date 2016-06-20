#!/bin/bash
infile="Si1x1.in"
outfile="Rif3D.dat"

if [ -e $outfile ]; then
    rm -rf $outfile
fi

for THETA in $(seq -f "%03g" 0 1 90); do
    sed -i '' -e "3s/.*/theta: ${THETA}/" ${infile}
    for PHI in $(seq -f "%03g" 0 1 90); do
        output="RiF-theta_${THETA}.phi_${PHI}.dat"
        sed -i '' -e "4s/.*/phi: ${PHI}/" -e "33s/.*/output: ${output}/" ${infile}
        /Users/sma/anaconda/bin/python shgyield.py ${infile}
        tail -n +3 ${output} > ${output}.tmp && mv ${output}.tmp ${output}
        awk -v value1=${THETA} -v value2=${PHI} '{printf "%s  %03d  %03d  %s  %s  %s  %s\n", $1,value1,value2,$2,$3,$4,$5}' ${output} >> ${outfile}
        echo "" >> ${outfile}
        rm ${output}
    done
done

