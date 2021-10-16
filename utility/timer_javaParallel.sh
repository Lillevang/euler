#!/bin/bash

javac ../12_highly_divisible_triangular_number/SolutionParallel.java
mv ../12_highly_divisible_triangular_number/SolutionParallel.class ./SolutionParallel.class

startTime=`date +%s%N | cut -b1-13`
N=100

while [[ $i -le $N ]]
do 
    java SolutionParallel
    ((i = i + 1))
done

endTime=`date +%s%N | cut -b1-13`;

totalTime=$(($endTime-$startTime));
avgTime=$(($totalTime/$N));

echo "Java ParallelStream"
echo "Total runtime: $totalTime"
echo "Average runtime: $avgTime"

rm ./SolutionParallel.class

exit 0;
