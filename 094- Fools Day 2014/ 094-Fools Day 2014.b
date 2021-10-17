import java.util.Scanner;

public class fool {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int count = input.nextInt();
       
        for (int i=0;i<count+1;i++){
            int total = 0;
            String line = input.nextLine();
            String[] chars = line.split(" ");

            for (int k=0;k<chars.length;k++){

                try{
                    int value = Integer.parseInt(chars[k]);
                    total += value*value;
                }
                catch (NumberFormatException e){

                }

            }
            System.out.println(total);
        }

    }
}