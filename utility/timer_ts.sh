#!/bin/bash

startTime=`date +%s%N | cut -b1-13`
N=100

while [[ $i -le $N ]]
do 
    node ../.vscode/out/12_highly_divisible_triangular_number/divisible_triangular_number_solution.js;
    ((i = i + 1))
done

endTime=`date +%s%N | cut -b1-13`;

totalTime=$(($endTime-$startTime));
avgTime=$(($totalTime/$N));

echo "Typescript"
echo "Total runtime: $totalTime"
echo "Average runtime: $avgTime"

exit 0;
