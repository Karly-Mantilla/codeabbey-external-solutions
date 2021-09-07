import java.util.Scanner;
public class Main {

    static int[][] mat=new int[4][4];
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        
        for(int i=0;i<4;i++)
        {
            for(int j=0;j<4;j++)
            {
                mat[i][j]=sc.nextInt();
            }
        }
       
       String input=sc.next();
       int len=input.length();
       for(int i=0;i<len;i++)
       {
           if(input.charAt(i)==' ')
           {
               
           }
           else
           {
           if(input.charAt(i)=='L')
               left();
           if(input.charAt(i)=='R')
               right();
           if(input.charAt(i)=='U')
               up();
           if(input.charAt(i)=='D')
               down();
           }
               
       }
       
       int count_2=0,count_4=0,count_8=0,count_16=0,count_32=0,count_64=0,count_128=0,count_256=0,count_512=0,count_1024=0,count_2048=0;
       int[] a=new int[11];
       for(int i=0;i<4;i++)
       {
           for(int j=0;j<4;j++)
           {
              
                if(mat[i][j]==2)
                {
                    count_2++;
                    a[0]=count_2;
                }
                if(mat[i][j]==4)
                { 
                    count_4++;
                    a[1]=count_4;
                }
                if(mat[i][j]==8)
                {  
                    count_8++;
                    a[2]=count_8;
                }
                if(mat[i][j]==16)
                {
                    count_16++;
                    a[3]=count_16;
                }
                if(mat[i][j]==32)
                {
                    count_32++;
                    a[4]=count_32;
                }
                if(mat[i][j]==64)
                {
                    count_64++;
                    a[5]=count_64;
                }
                if(mat[i][j]==128)
                {
                    count_128++;
                    a[6]=count_128;
                }
                if(mat[i][j]==256)
                {
                    count_256++;
                    a[7]=count_256;
                }
                if(mat[i][j]==512)
                {
                    count_512++;
                    a[8]=count_512;
                }
                if(mat[i][j]==1024)
                {
                    count_1024++;
                    a[9]=count_1024;
                }
                if(mat[i][j]==2048)
                {
                    count_2048++;
                    a[10]=count_2048;
                }
             
              
           }
       }
       int index=0;
       for(int i=10;i>=0;i--)
       {
           if(a[i]!=0)
           {
               index=i;
               break;
           }
       }
       for(int i=0;i<=index;i++)
            System.out.print(a[i]+" ");
        
    }
    public static void down()
    {   
        for(int i=0;i<4;i++)
        {
            if(mat[3][i]==mat[2][i])
            {
                mat[3][i]=mat[3][i]+mat[2][i];
                mat[2][i]=0;
            }
            if(mat[2][i]==mat[1][i])
            {
                mat[2][i]=mat[2][i]+mat[1][i];
                mat[1][i]=0;
            }
            if(mat[1][i]==mat[0][i])
            {
                mat[1][i]=mat[1][i]+mat[0][i];
                mat[0][i]=0;
            }
        }
        int index=0;
        for(int i=2;i>=0;i--)
        {
            for(int j=i+1;j<=i+1;j++)
            {   for(int a=0;a<4;a++)
               {
                 if(mat[j][a]==0)
               {  if(j==3)
               {
                   mat[j][a]=mat[i][a];
                   mat[i][a]=0;
               }
               else
               {
                   for(int x=j;x<=3;x++)
                   {
                       if(mat[x][a]!=mat[i][a]&&mat[x][a]!=0)
                       {
                           break;
                       }
                       if(mat[x][a]==0)
                       {
                           index=x;
                       }
                   }
                   mat[index][a]=mat[i][a];
                           mat[i][a]=0;
               }
               }
               
               }
            }
        }
        
        
        
    }
    
    public static void up()
    {
        
        for(int i=0;i<4;i++)
        {
            if(mat[0][i]==mat[1][i])
            {
                mat[0][i]=mat[0][i]+mat[1][i];
                mat[1][i]=0;
            }
            if(mat[1][i]==mat[2][i])
            {
                mat[1][i]=mat[1][i]+mat[2][i];
                mat[2][i]=0;
            }
            if(mat[2][i]==mat[3][i])
            {
                mat[2][i]=mat[2][i]+mat[3][i];
                mat[3][i]=0;
            }
        }
        int index=0;
        for(int i=1;i<=3;i++)
        {
            for(int j=i-1;j<=i-1;j++)
            {   for(int a=0;a<4;a++)
               {
                if(mat[j][a]==0)
               {   if(j==0)
               {
                    mat[j][a]=mat[i][a];
                   mat[i][a]=0;
               }
               else
               {
                   for(int x=j;x>=0;x--)
                   {
                       if(mat[x][a]!=mat[i][a]&&mat[x][a]!=0)
                       {
                           break;
                       }
                       if(mat[x][a]==0)
                       {
                           index=x;
                       }
                   }
                   mat[index][a]=mat[i][a];
                           mat[i][a]=0;
               }
                  
               }
               
               }
            }
        }
        
    }
    public static void right()
    {  
        for(int i=0;i<4;i++)
        {
            if(mat[i][3]==mat[i][2])
            {
                mat[i][3]=mat[i][3]+mat[i][2];
                mat[i][2]=0;
            }
            if(mat[i][2]==mat[i][1])
            {
                mat[i][2]=mat[i][2]+mat[i][1];
                mat[i][1]=0;
            }
            if(mat[i][1]==mat[i][0])
            {
                mat[i][1]=mat[i][1]+mat[i][0];
                mat[i][0]=0;
            }
        }
        
        int index=0;
        for(int i=2;i>=0;i--)
        {
            for(int j=i+1;j<=i+1;j++)
            {   
                for(int a=0;a<4;a++)
               {
                 if(mat[a][j]==0)
                { if(j==3)
                {
                   mat[a][j]=mat[a][i];
                   mat[a][i]=0;
                }
                else
                {
                    for(int x=j;x<=3;x++)
                   {
                       if(mat[a][x]!=mat[a][i]&&mat[a][x]!=0)
                       {
                           break;
                       }
                       if(mat[a][x]==0)
                       {
                           index=x;
                       }
                   }
                   mat[a][index]=mat[a][i];
                           mat[a][i]=0;
                }
                }
               }
            }
        }
        
        
    }
    
    public static void left()
    {   
        for(int i=0;i<4;i++)
        {
            if(mat[i][0]==mat[i][1])
            {
                mat[i][0]=mat[i][0]+mat[i][1];
                mat[i][1]=0;
            }
            if(mat[i][1]==mat[i][2])
            {
                mat[i][1]=mat[i][1]+mat[i][2];
                mat[i][2]=0;
            }
            if(mat[i][2]==mat[i][3])
            {
                mat[i][2]=mat[i][2]+mat[i][3];
                mat[i][3]=0;
            }
        }
        int index=0;
        for(int i=1;i<=3;i++)
        {
            for(int j=i-1;j<=i-1;j++)
            {   for(int a=0;a<4;a++)
               {
                if(mat[a][j]==0)
               {  if(j==0)
               {
                   mat[a][j]=mat[a][i];
                   mat[a][i]=0;
               }
               else
               {
                   for(int x=j;x>=0;x--)
                   {
                       if(mat[a][x]!=mat[a][i]&&mat[a][x]!=0)
                       {
                           break;
                       }
                       if(mat[a][x]==0)
                       {
                           index=x;
                       }
                   }
                   mat[a][index]=mat[a][i];
                           mat[a][i]=0;
               }
               }
               
               }
            }
        
        }
        
    
    }
    
}

