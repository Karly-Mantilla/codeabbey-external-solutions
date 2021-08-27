program main                                                                    
  implicit none                                                                 
  integer  :: tot, n, its, t                                                    
  double precision  :: r, x                                                     
                                                                                
  open(10, file='input')                                                        
  read(10, *) tot                                                               
                                                                                
  do n = 1, tot                                                                 
     read(10, *) x                                                              
     read(10, *) its                                                            
                                                                                
     r = 1                                                                      
     do t = 1, its                                                              
        r = (r + x / r) / 2.                                                    
     enddo                                                                      
                                                                                
     print '(F19.13, $)', r                                                     
  enddo                                                                         
end program main