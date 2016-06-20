num1=($(seq -f "%03g" 1 1 90))
num2=($(seq -f "%03g" 91 1 180))

num3=($(seq -f "%03g" -90 1 0))
num4=($(seq -f "%03g" 0 1 90))

for ((i=0;i<${#num1[@]};++i)); do
    sed -i '' "s/01.70    ${num1[i]}/01.70    ${num2[i]}/g" E1_angles.dat
done

for ((i=0;i<${#num3[@]};++i)); do
    sed -i '' "s/01.70    ${num3[i]}/01.70    ${num4[i]}/g" E1_angles.dat
done
