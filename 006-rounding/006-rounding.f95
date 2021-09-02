program rounding
        implicit none
        integer :: a, b, round_quot
        integer :: i, num_loops
        character(20) :: rounded_answer
        character(1024) :: buffer
        
        ! Read in number of pairs
        read *, num_loops
        write (buffer, "(a)") ""
        do i = 1, num_loops
          ! Read in numbers
          read *, a, b
          ! Internal write the result.
          write (rounded_answer, "(i20)") round_quot(a, b)

          ! Format result.
          rounded_answer = adjustl(rounded_answer)
          if (i .eq. 1) then
            write (buffer, "(a)") rounded_answer
          else
            write (buffer, "(a,a,a)") trim(buffer), " ", rounded_answer
          end if
          
        end do

        print "(a)", buffer
        
      end program

      integer function round_quot(a, b)
        ! Rounds a number.
        implicit none
        integer, intent(in) :: a, b

        round_quot = int(anint(real(a) / real(b)))
      end function round_quot