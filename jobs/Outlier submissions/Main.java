import java.util.*;


public class Main {


 // Method to swap two numbers without using a third variable
 static void swapValuesUsingThirdVariable(int m, int n)
 {
 // Display the original values of m and n
 System.out.println("Original value of m: " + m);
 System.out.println("Original value of n: " + n);
 
 // Step 1: Add the value of n to m. After this step, m has the sum of m and n.
 m = m + n;
 // Step 2: Subtract the new value of m (which is m + n) by n, which gives the original value of m. Assign this value to n.
 n = m - n;
 // Step 3: Now that n has the original value of m, subtract the new value of n from the current value of m (which is m + n). This gives the original value of n, assigned back to m.
 m = m - n;
 
 // Display the swapped values of m and n
 System.out.println("Swapped value of m: " + m);
 System.out.println("Swapped value of n: " + n);
 }


 public static void main(String[] args)
 {
 // Assigning specific integer values to m and n for demonstration
 int m = 3, n = 5;


 // Call the method to swap the values of m and n
 swapValuesUsingThirdVariable(m, n);
 }
}