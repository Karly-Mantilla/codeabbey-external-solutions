program palindrome
  implicit none
!This program is designed to find the largest palindrome
!that is the product of two numbers of varying size. The
!default size is two 3 digit numbers.

!Assigning variable types
  integer :: x, d, rev, r, store
  integer :: n1, n2, i, k, size, h, f, w, z
  integer, dimension(1000000) :: n, m

  real :: start, end

!These are the counters for the system
  i = 1
  k = 0

!This is the initialization of the program
  write(*,*)'We are going to find the largest'
  write(*,*)'palindrome for a number that'
  write(*,*)'is the product of two numbers'
  write(*,*)
  write(*,*)'What size do you want to check for?'
  write(*,*)
  write(*,*)'Default                              [0]'
  write(*,*)'Two one digit numbers                [1]'
  write(*,*)'A one digit and a two digit number   [2]'
  write(*,*)'A one digit and a three digit number [3]'
  write(*,*)'Two two digit numbers                [4]'
  write(*,*)'A two digit and a three digit number [5]'
  write(*,*)'Two three digit numbers              [6]'
  read(*,*)size

!h is the starting value of n1
!f is the final value for n1
!w is the starting value of n2
!z is the final value for n2
  if(size.eq.1)then
     h=1
     f=9
     w=1
     z=9
  end if

  if(size.eq.2)then
     h=1
     f=9
     w=90
     z=99
  end if

  if(size.eq.3)then
     h=1
     f=9
     w=900
     z=999
  end if

  if(size.eq.4)then
     h=90
     f=99
     w=90
     z=99
  end if

  if(size.eq.5)then
     h=90
     f=99
     w=900
     z=999
  end if

  if(size.eq.6 .or. size.eq.0)then
     h=900
     f=999
     w=900
     z=999
  end if

  call cpu_time(start)

!This is the loop that finds the palindromes
  do n1 = h, f
     do n2 = w, z
!Here is where the number in question is produced         
        n(i) = n1*n2

!Some more initialization        
        x = n(i)
        rev = 0

!This loop calculates the check number, rev        
        do while(x.ne.0)
           
           d = mod(x,10)
           x = x/10
           rev = (rev*10) + d
           
        end do
!This is the logical determination of whether n is a 
!palindrome or not        
        if(rev.eq.n(i))then
           r = 1 !n is a palindrome
        else
           r = 0 !n is not a palindrome
        end if

!This takes all palindromes and stores them into a list        
        if(r.eq.1)then
           k = k + 1
           m(k) = n(i)
        end if

        i = i + 1

     end do
  end do

!This loop finds the largest number in the list of
!palindromes.
  do i = 2, k

!This statement assigns the largest current value
!to the variable store. The sereach will save this
!variable until a new value is found that is larger
!the current store value. The new largest value 
!will become the new store value.     
     if(m(i-1).gt.m(i))then
        m(i) = m(i-1)  !Swapping values
        store = m(i)   !Assignment
     else
        store = m(i)   !Assignment
     end if

  end do

!Once all the iterations are finished the value
!store will be the largest value in the list of
!data. Store is then returned so that the value
!can be read.
  write(*,*)store

  call cpu_time(end)
  write(*,*)'Time to exicute = ',end-start

end program palindrome