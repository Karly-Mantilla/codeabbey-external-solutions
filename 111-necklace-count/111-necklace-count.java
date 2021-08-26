package codeabbey.problems;

import java.util.Scanner;

public class Problem111 {

    private static Scanner scanner;

    public Problem111(Scanner scanner) {
        this.scanner = scanner;
        exec();
    }

    private static void exec() {
        int n = scanner.nextInt();
        int[] res = new int[n];

        for (int i = 0; i < n; i++) {
            int b = scanner.nextInt();
            int numb = scanner.nextInt();

            for (int j = 0; j < numb; j++) {
                res[i] += (int) Math.pow(b, gcd(j, numb));
            }
            res[i] /= numb;
        }

        System.out.println("OutPut: \n");
        for (int i = 0; i < n; i++) {
            System.out.print(res[i] + " ");
        }
        System.out.println();
    }

    private static int euler(int n) {
        int res = n;
        for (int i = 2; i * i < n; i++) {
            if (n % i == 0) {
                while (n % i == 0)
                    n /= i;
                res -= res / i;
            }
        }
        if (n > 1)
            return res -= res / n;
        return res;
    }

    private static long gcd(long a, long b) {
        return b == 0 ? a : gcd(b, a % b);
    }

    private static long lcm(long a, long b) {
        return a / gcd(a, b) * b;
    }
}