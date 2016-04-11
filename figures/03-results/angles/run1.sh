start="0"
/Users/sma/anaconda/bin/python shgyield.py input.in
for num in $(seq 01 01 90); do
    sed -i '' -e "s/theta: ${start}/theta: ${num}/g" -e "s/output: ${start}.dat/output: ${num}.dat/g" input.in
    /Users/sma/anaconda/bin/python shgyield.py input.in
    ((start = start + 1))
done

for num in $(seq 00 01 09); do
    mv ${num}.dat 0${num}.dat
done
