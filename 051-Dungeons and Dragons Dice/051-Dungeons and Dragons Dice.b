
import java.util.*;

public class Solution {

    static Scanner s=new Scanner(System.in);

    public static void main(String[] args) {
        double[][] nar=new double[3][100];
        for(int i=0; i<3; i++){
            for(int j=0;; j++){
                int n=s.nextInt();
                if(n!=0){
                    nar[i][j]=n;
                }else{
                    break;
                }
            }
        }

        double[][] dar=new double[5][6];
        for(int i=0; i<5; i++){
            for(int j=0; j<6; j++){
                dar[i][j]=((i+1)*(j*2+2+1)/2.0);
            }
        }

        double[] avg=new double[3];
        for(int i=0; i<3; i++){
            double t=0;
            for(int j=0; j<100; j++){
                t+=nar[i][j];
            }
            avg[i]=t/100.0;
        }
        for(int i=0; i<3; i++){
            avg[i]-=avg[i]%0.5;
            if(avg[i]>32.5){
                avg[i]=32.5;
            }
            if(avg[i]<1.5){
                avg[i]=1.5;
            }
        }

        for(int k=0; k<3; k++){
            find:
            for(int i=0; i<5; i++){
                for(int j=0; j<6; j++){
                    if(avg[k]==dar[i][j]){
                        int ri=i+1;
                        int rj=j*2+2;
                        System.out.print(ri+"d"+rj+" ");
                        break find;
                    }
                }
            }
        }

    }//end main
}//end class