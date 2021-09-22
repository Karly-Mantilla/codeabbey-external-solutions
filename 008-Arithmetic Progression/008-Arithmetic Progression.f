program artith_seq
    implicit none

    integer :: i, num_items
    integer :: first_value, step, num_values
    real :: arith_sq_sum, sum

    character(20) :: sum_str
    character(1024) :: buffer

    write (buffer, *) ""
    read (*, *) num_items

    do i = 1, num_items

        read (*, *) first_value, step, num_values
        ! a + (a + b) + ... + (a + (n-1)b)
        ! = a(n) + b(1 + 2 + ... + (n-1))
        ! = a(n) + b(n((n-1)/2))
        ! = n (a + b((n-1)/2))
        arith_sq_sum = step * ((num_values - 1.) / 2.)
        sum = num_values * (first_value + arith_sq_sum)
        write (sum_str, "(i20)") int(sum)

        ! Print to buffer
        if (i .eq. 1) then
            write (buffer, "(a)") adjustl(sum_str)
          else
            write (buffer, "(a,a,a)") trim(buffer), " ", adjustl(sum_str)
          end if

    end do

    print "(a)", buffer

end program