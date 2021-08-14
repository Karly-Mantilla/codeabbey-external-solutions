program triangle

    implicit none

    integer :: i, num_items
    integer :: a, b, c, output
    logical :: c1, c2, c3

    character(1024) :: buffer

    write (buffer, *) ""
    read (*, *) num_items

    do i = 1, num_items

        read (*, *) a, b, c

        output = 1
        c1 = a + b .lt. c
        c2 = b + c .lt. a
        c3 = a + c .lt. b
        if (c1 .or. c2 .or. c3) then
            output = 0
        end if

        ! Print to buffer
        if (i .eq. 1) then
            write (buffer, "(i1)") output
          else
            write (buffer, "(a,a,i1)") trim(buffer), " ", output
          end if

    end do

    print "(a)", buffer

end program