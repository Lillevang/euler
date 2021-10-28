# Lattice paths

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
<center><img src="../assets/15_img.png"></center>

How many such routes are there through a 20×20 grid?


## Solution

The solution can be calculated as follows:

$$\frac{2n!}{n!\times n!}$$

Solution using n = 2:

$$\frac{4!}{2! \times 2!} \Rightarrow \frac{24}{2 \times 2} \Rightarrow \frac{24}{4} = 6 $$