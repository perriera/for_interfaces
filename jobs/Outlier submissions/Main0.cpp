import java.util.*;


public class SwapNumbers {


    static void swapValuesUsingThirdVariable(int m, int n)
    {
        System.out.println("Original value of m: " + m);
        System.out.println("Original value of n: " + n);

        m = m + n;
        n = m - n;
        m = m - n;

        System.out.println("Swapped value of m: " + m);
        System.out.println("Swapped value of n: " + n);
    }


    public static void main(String[] args)
    {
        // Assigning random integer values
        int m = 3, n = 5;


        swapValuesUsingThirdVariable(m, n);
    }
}

Original value of m : 3
Original value of n : 5
Swapped value of m : 5
Swapped value of n : 3


Status : ok
Time : 0.06
Score : 0




