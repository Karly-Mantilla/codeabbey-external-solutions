program proto
	common /alfa/k(3,3),kk(3,3)
	character kk
	integer k,c,e
	kk='.'
	kk(2,2)='X'
        b=1
	write(*,*) '           ','For the array'
	write(*,*)
	write(*,*)'            1.','   2.','  3.'
	do 3 c=1,3
	write(*,*)c,' ',kk(c,1),'    ',kk(c,2),'    ',kk(c,3)
	write(*,*)
    3	enddo
        k=9
	k(2,2)=1
        do 5 d=1,4
	write(*,*) 'Give i,l for k(i,l)'
	write(*,15) 
   15	format('i=',$)
        read(*,*) n
	write(*,16)
   16	format('l=',$)
        read(*,*) m
	write(*,*)
	write(*,*)
	k(n,m)=0
	
	if(k(1,3)==1.and.k(1,2)==0.and.k(3,1)==0.and.k(1,1)==9.and.k(2,1)==9.and.k(2,3)==9.and.k(3,2)==9.and.k(3,3)==9)then
	k(3,3)=1
	b=4
	goto 10
	endif
	if(k(1,3)==0.and.k(1,2)==9.and.k(3,1)==9.and.k(1,1)==9.and.k(2,1)==9.and.k(2,3)==9.and.k(3,2)==9.and.k(3,3)==9)then
	k(1,1)=1
	b=2
	goto 10
	endif
        if(b==1) then
	do 8 i=1,3
	if(k(i,1)==1.and.k(i,2)==1.and.k(i,3)==9) then 
	k(i,3)=1
        b=3
	goto 1
	endif
	if(k(i,1)==1.and.k(i,3)==1.and.k(i,2)==9)then
	k(i,2)=1
        b=3
	goto 1
	endif
	if(k(i,2)==1.and.k(i,3)==1.and.k(i,1)==9)then
	k(i,1)=1
	b=3
	goto 1
	endif
	if(k(1,i)==1.and.k(2,i)==1.and.k(3,i)==9)then
	k(3,i)=1
	b=3
	goto 1
	endif
	if(k(1,i)==1.and.k(3,i)==1.and.k(2,i)==9)then 
	k(2,i)=1
	b=3
	goto 1
	endif
	if(k(2,i)==1.and.k(3,i)==1.and.k(1,i)==9)then 
	k(1,i)=1 
	b=3
	goto 1
	endif
	if(k(1,1)==1.and.k(2,2)==1.and.k(3,3)==9)then 
	k(3,3)=1
	b=3
	goto 1
	endif
	if(k(1,1)==1.and.k(3,3)==1.and.k(2,2)==9)then 
	k(2,2)=1
	b=3
	goto 1
	endif
	if(k(2,2)==1.and.k(3,3)==1.and.k(1,1)==9)then 
	k(1,1)=1
	b=3
	goto 1
	endif
	if(k(1,3)==1.and.k(2,2)==1.and.k(3,1)==9)then 
	k(3,1)=1
        b=3
	goto 1
	endif
	if(k(1,3)==1.and.k(3,1)==1.and.k(2,2)==9)then 
	k(2,2)=1
        b=3
	goto 1
	endif
	if(k(2,2)==1.and.k(3,1)==1.and.k(1,3)==9)then 
	k(1,3)=1
        b=3
	goto 1
	endif
    8	enddo
        endif

      
    1   if(b==1)then
	do 2 i=1,3
	if(k(i,1)==0.and.k(i,2)==0.and.k(i,3)==9) then 
	k(i,3)=1
        b=0
	goto 10
	endif
	if(k(i,1)==0.and.k(i,3)==0.and.k(i,2)==9)then
	k(i,2)=1
        b=0
	goto 10
	endif
	if(k(i,2)==0.and.k(i,3)==0.and.k(i,1)==9)then
	k(i,1)=1
	b=0
	goto 10
	endif
	if(k(1,i)==0.and.k(2,i)==0.and.k(3,i)==9)then
	k(3,i)=1
	b=0
	goto 10
	endif
	if(k(1,i)==0.and.k(3,i)==0.and.k(2,i)==9)then 
	k(2,i)=1
	b=0
	goto 10
	endif
	if(k(2,i)==0.and.k(3,i)==0.and.k(1,i)==9)then 
	k(1,i)=1 
	b=0
	goto 10
	endif
	if(k(1,1)==0.and.k(2,2)==0.and.k(3,3)==9)then 
	k(3,3)=1
	b=0
	goto 10
	endif
	if(k(1,1)==0.and.k(3,3)==0.and.k(2,2)==9)then 
	k(2,2)=1
	b=0
	goto 10
	endif
	if(k(2,2)==0.and.k(3,3)==0.and.k(1,1)==9)then 
	k(1,1)=1
	b=0
	goto 10
	endif
	if(k(1,3)==0.and.k(2,2)==0.and.k(3,1)==9)then 
	k(3,1)=1
        b=0
	goto 10
	endif
	if(k(1,3)==0.and.k(3,1)==0.and.k(2,2)==9)then 
	k(2,2)=1
        b=0
	goto 10
	endif
	if(k(2,2)==0.and.k(3,1)==0.and.k(1,3)==9)then 
	k(1,3)=1
        b=0
	goto 10
	endif
    2	enddo
        endif


        if(b==1) then
	do 9 i=1,3
	do 9 l=1,3
        a=abs(l-4)
	if(k(i,a)==9)then
	k(i,a)=1
	goto 10
	endif
    9	enddo
        endif
   10   b=1
        call characterr()
        write(*,*) '                 ','The array is'
	write(*,*)
	write(*,*)'             1.','         2.','        3.'
	write(*,*)
	do 4 e=1,3
	write(*,*)e,'. ',kk(e,1),'          ',kk(e,2),'         ',kk(e,3)
	write(*,*)
	write(*,*)
    4	enddo

        do 12 i=1,3
        if(k(i,1)==k(i,2).and.k(i,2)==k(i,3).and.k(i,3)==0) then
        write(*,*) 'You won!'
	goto 13
	endif
	if(k(1,i)==k(2,i).and.k(2,i)==k(3,i).and.k(3,i)==0)then
        write(*,*) 'You won!'
	goto 13
	endif
	if(k(1,1)==k(2,2).and.k(2,2)==k(3,3).and.k(3,3)==0)then
        write(*,*) 'You won!'
	goto 13
	endif
	if(k(1,3)==k(2,2).and.k(2,2)==k(3,1).and.k(3,1)==0)then
        write(*,*) 'You won!'
	goto 13
	endif
   12	enddo

        do 14 i=1,3
        if(k(i,1)==k(i,2).and.k(i,2)==k(i,3).and.k(i,3)==1) then
        write(*,*) 'I won!'
	goto 13
	endif
	if(k(1,i)==k(2,i).and.k(2,i)==k(3,i).and.k(3,i)==1)then
        write(*,*) 'I won!'
	goto 13
	endif
	if(k(1,1)==k(2,2).and.k(2,2)==k(3,3).and.k(3,3)==1)then
        write(*,*) 'I won!'
	goto 13
	endif
	if(k(1,3)==k(2,2).and.k(2,2)==k(3,1).and.k(3,1)==1)then
        write(*,*) 'I won!'
	goto 13
	endif
   14	enddo

    5   enddo
   13   write(*,*)
        read(*,*) i 

        end

	subroutine characterr()
	implicit none
	common /alfa/k(3,3),kk(3,3)
	integer i,l,k
	character kk
	do 16 i=1,3
	do 16 l=1,3
	if(k(i,l)==0)kk(i,l)='O'
	if(k(i,l)==1)kk(i,l)='X'
	if(k(i,l)==9)kk(i,l)='.'
   16   enddo
        return
        end



