import java.util.*;

public class Solution {

    private static List<Integer> getDivisors(int n) {
        var divisors = new ArrayList<Integer>();
        for (int i = 1; i * i <= n; i++ ) {
            if (n % i == 0) {
                divisors.add(i);
                if (i != n / i) divisors.add(n / i);
            }
        }
        return divisors;
    }


    public static void main(String[] args) {
        
        var numbers = new HashSet<Integer>();
        var found = false;
        var cnt = 1;
        while (!found) {
            numbers.add(cnt);
            var triangularNumber = numbers.stream().reduce(0, (subtotal, element) -> subtotal + element);

            found = getDivisors(triangularNumber).size() > 500;
            if (found) {
                System.out.println(triangularNumber);
            } 
            cnt++;
        }
    }
}