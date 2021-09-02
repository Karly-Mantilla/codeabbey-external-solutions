program    main                                                                    
  implicit none                                                                 
  real  :: a, b, n, tot                                                         
                                                                                
  open(10, file="input")                                                        
                                                                                
  read(10,*) tot                                                                
                                                                                
  do n = 1, tot                                                                 
     read(10,*), a                                                              
     read(10,*), b                                                              
     print "(I7,$)", nint(a / b)                                                
  enddo                                                                         
                                                                                
  close(10)                                                                     
                                                                                
end program main