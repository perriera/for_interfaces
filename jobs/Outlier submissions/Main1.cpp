import java.util.*;


public class SwapNumbers {


    // Method to swap two integers without using a third variable
    static void swapValuesUsingThirdVariable(int m, int n) {
        // Print the original values of m and n
        System.out.println("Original value of m: " + m);
        System.out.println("Original value of n: " + n);


        // Add n to m
        m = m + n;


        // Subtract m from n
        n = n - m;


        // Subtract n from m
        m = m - n;


        // Print the swapped values of m and n
        System.out.println("Swapped value of m: " + m);
        System.out.println("Swapped value of n: " + n);
    }


    public static void main(String[] args) {
        // Assign random integer values to m and n
        int m = 3, n = 5;


        // Call the swapValuesUsingThirdVariable method
        swapValuesUsingThirdVariable(m, n);
    }
}