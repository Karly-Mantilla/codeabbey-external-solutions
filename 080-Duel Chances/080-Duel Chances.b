public static void main(String[] args){
        int[][] aa=new int[][]{
            {71, 80},
            {48, 68},
            {47, 35},
            {59, 17},
            {28, 70},
            {90, 57},
            {25, 52},
            {34, 28},
            {37, 44},
            {39, 44},
            {62, 22},
            {12, 86},
            {37, 15},
            {17, 24},
            {83, 12},
            {47, 64},
            {82, 85},
            {41, 39},
            {30, 10},
            {46, 49},
            {71, 46},
            {15, 86},
            {88, 40}
        };
        
        for (int i = 0; i <aa.length; i++) {
            int pa=aa[i][0];
            int pb=aa[i][1];
             double rta=0;
             double rtb=0;
             double cn=0;
             for (int ii = 0; ii <1e7; ii++) {
                 if(prob(pa)==true){
                     rta++;
                     cn++;
                 }
                else if(prob(pb)==true){
                     rtb++;
                     cn++;
                 }

             }
             
             System.out.print(roundd(100*rta/cn)+" ");

        }
        
    }
    
    static int roundd(double dv){
           double dec=Math.abs((dv- (int)dv) );
            if(dec>=0.5) {
                if(dv>0) {
                    dv=1+(int)dv;
                }else{
                    dv=-1+(int)dv;
                }
            }else{
                dv=(int)dv;
            }
            return (int)dv;
                    
    }
      
    static boolean prob(int probb ){
        boolean yy;
        int randd=0;
        randd=(int)(Math.random()*100+1);  //-1-10
        if(randd<=probb){
            yy=true;
        }else{
            yy=false;          
        }
        return yy;
        
    }