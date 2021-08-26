program main                                                                    
  implicit none                                                                 
  integer  :: a, b, c, n, ans(20)                                               
                                                                                
  open(10, file="input")                                                        
                                                                                
  do n = 1, 20                                                                  
     read(10,*), a                                                              
     read(10,*), b                                                              
     read(10,*), c                                                              
                                                                                
     if (a .lt. b .and. a .lt. c) then                                          
        print "(I9,$)", a                                                       
     elseif (b .lt. a .and. b .lt. c) then                                      
        print "(I9,$)", b                                                       
     else                                                                       
        print "(I9,$)", c                                                       
     endif                                                                      
  enddo                                                                         
                                                                                
  close(10)                                                                     
end program main