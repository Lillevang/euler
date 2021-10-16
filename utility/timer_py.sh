#!/bin/bash

startTime=`date +%s%N | cut -b1-13`
N=100

while [[ $i -le $N ]]
do 
    python3 ../12_highly_divisible_triangular_number/Solution.py
    ((i = i + 1))
done

endTime=`date +%s%N | cut -b1-13`;

totalTime=$(($endTime-$startTime));
avgTime=$(($totalTime/$N));

echo "Python numba"
echo "Total runtime (ms): $totalTime"
echo "Average runtime (ms): $avgTime"

exit 0;
