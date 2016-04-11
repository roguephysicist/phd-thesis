for num in $(seq -f "%02g" 00 01 90); do
    file="${num}_sm0.10.dat"
    tail -n +2 "data/${file}" > tmp && mv tmp $file
    awk '{print '"${num}, "'$0}' $file > tmp && mv tmp $file
    #sed -i '' -e '$a\' $file
done


awk 'FNR==1{print ""}1' *.dat > fullspectrum
rm *.dat
mv fullspectrum 3DRiF.dat
