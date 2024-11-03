import java.time.LocalDate;

class Solution {

    // How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

    public static void main(String[] args) {
        var year = 1901;
        var sundays = 0;
        while (year < 2001) {
            for(int i = 1; i <= 12; i++) {
                if (LocalDate.of(year, i, 1).getDayOfWeek().toString().equals("SUNDAY")) {
                    sundays++;
                }
            }
            year++;            
        }
        System.out.println(sundays);
    }
}