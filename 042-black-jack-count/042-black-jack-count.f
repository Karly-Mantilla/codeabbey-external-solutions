program main                                                                                                  
  implicit none                                                                                               
  character(len=1)  :: card                                                                                   
  integer  :: n, hand, tot, acecount                                                                          
  logical  :: eohand                                                                                          
                                                                                                              
  open(10, file='input')                                                                                      
  read(10, *) tot                                                                                             
  reaD(10, *) ! Skip extra zero from special formatting                                                       
                                                                                                              
  do n = 1, tot                                                                                               
     hand = 0                                                                                                 
     acecount = 0                                                                                             
     eohand = .false.                                                                                         
                                                                                                              
     do while(eohand .eqv. .false.)                                                                           
        read(10, *) card                                                                                      
        if (card .eq. '0') then                                                                               
           eohand = .true.                                                                                    
        elseif (card .eq. 'A') then                                                                           
           acecount = acecount + 1                                                                            
        elseif (card .eq. 'K' .or. card .eq. 'Q') then                                                        
           hand = hand + 10                                                                                   
        elseif (card .eq. 'J' .or. card .eq. 'T') then                                                        
           hand = hand + 10                                                                                   
        else                                                                                                  
           hand = hand + ichar(card) - 48                                                                     
        endif                                                                                                 
     enddo                                                                                                    
                                                                                                              
     ! Aces                                                                                                   
     if (hand + 11 + acecount - 1 .le. 21) then                                                               
        hand = hand + 11 + acecount - 1                                                                       
     elseif(hand + 11 .gt. 21) then                                                                           
        hand = hand + acecount                                                                                
     endif                                                                                                    
                                                                                                              
                                                                                                              
     if (hand .gt. 21) then                                                                                   
        print '(A5, $)', 'Bust'                                                                               
     else                                                                                                     
        print '(I3, $)', hand                                                                                 
     endif                                                                                                    
  enddo                                                                                                       
                                                                                                              
  close(10)                                                                                                   
end program main