package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int casesNum = in.nextInt();
        for (int i = 0; i < casesNum; i++) {
            int[] cycle = new int[1000000];
            int num = in.nextInt();
            int n = 0;
            int o = 0;
            cycle[o] = num;
            while(n != -1){
                num = (num * num);
                num = (num/100)%10000;
                o++;
                cycle[o] = num;
                for (int j = 0; j < o; j++) {
                    for (int k = j + 1; k < o; k++) {
                        if(cycle[j] == cycle[k]){
                            n = -1;
                            System.out.println(k);
                        }
                    }
                }
            }
        }
    }
}
