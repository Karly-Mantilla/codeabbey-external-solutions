BEGIN{
          getline A
          i = 1
        n = split (A,B," ")
        while (i < n){
         temp1 = (B[i+1]-32)/1.8
         printf "%.0f\n", temp1                                                                                                                                
        i++
        }
}