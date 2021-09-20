import java.io.*;
import java.util.*;

public class Main {
    public static void main(String... args) {
        try (Scanner sc = new Scanner(new FileReader("C:\\files\\test.txt"))) {
            int[] array = new int[100];
            int count = 0;

            while (sc.hasNextInt()) {
                int x = sc.nextInt();

                if (x != 0)
                    array[count++] = x;
                else {
                    count = 0;
                    int min = 60;
                    int max = 2;

                    for (int i = 0; i < 100; i++) {
                        if (min > array[i]) min = array[i];
                        if (max < array[i]) max = array[i];
                    }

                    if (min > 5) {
                        int minRez = 60;

                        for (int a = 5; a >= 1; a--) {
                            for (int b = 2; b <= 12; b += 2)
                                if (a * b > max && minRez > (a * b - max)) {
                                    minRez = a * b - max;
                                    min = a;
                                }
                        }

                        max += minRez;
                    }
                    else {
                        while (max % min != 0)
                            max++;
                    }

                    System.out.print(min + "d" + (max / min) + " ");
                }
            }
        } catch (FileNotFoundException e) {
            return;
        }
    }
}
