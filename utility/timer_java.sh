#!/bin/bash

javac ../12_highly_divisible_triangular_number/Solution.java
mv ../12_highly_divisible_triangular_number/Solution.class ./Solution.class

startTime=`date +%s%N | cut -b1-13`
N=100

while [[ $i -le $N ]]
do 
    java Solution
    ((i = i + 1))
done

endTime=`date +%s%N | cut -b1-13`;

totalTime=$(($endTime-$startTime));
avgTime=$(($totalTime/$N));

echo "Java"
echo "Total runtime: $totalTime"
echo "Average runtime: $avgTime"

rm ./Solution.class

exit 0;
