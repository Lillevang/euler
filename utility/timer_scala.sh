#!/bin/bash

scalac ../12_highly_divisible_triangular_number/TriangularFactors.scala

startTime=`date +%s%N | cut -b1-13`
N=100

while [[ $i -le $N ]]
do 
    scala TriangularFactors
    ((i = i + 1))
done

endTime=`date +%s%N | cut -b1-13`;

totalTime=$(($endTime-$startTime));
avgTime=$(($totalTime/$N));

echo "Scala"
echo "Total runtime: $totalTime"
echo "Average runtime: $avgTime"

rm ./*.class

exit 0;
