# Counting Sundays

You are given the following information, but you may prefer to do some research for yourself.

* 1 Jan 1900 was a Monday.
* Thirty days has September, 
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
* A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


## Solution 

There are implemented two solutions to this problem. One utilizing the Java date library in both Java and Scala. Additionally a solution in Scala.

However the solution is fairly simple and requires no code.
Given 100 years of 12 months this is simply divided by the possible number of days:

$$\frac{100 \times 12}{7} \Rightarrow \frac{1200}{7} = 171$$            