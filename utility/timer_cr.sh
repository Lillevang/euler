#!/bin/bash

crystal build ../12_highly_divisible_triangular_number/Solution.cr --release

startTime=`date +%s%N | cut -b1-13`
N=100

while [[ $i -le $N ]]
do 
    ./Solution
    ((i = i + 1))
done

endTime=`date +%s%N | cut -b1-13`;

totalTime=$(($endTime-$startTime));
avgTime=$(($totalTime/$N));

echo "Crystal"
echo "Total runtime (ms): $totalTime"
echo "Average runtime (ms): $avgTime"

rm ./Solution

exit 0;
