program vowel_count
    implicit none
    
    integer :: num_strs, count
    integer :: i, j

    character(1024) :: in_buffer, out_buffer
    character(20) :: count_str
    character(6) :: vowels = "aeiouy"
    character(1) :: char

    ! Init output_buffer
    write (out_buffer, "(a)") ""

    ! Get number inputs
    read (*, *) num_strs

    ! Loop through strings counting vowels
    do i = 1, num_strs
        read (*, "(a)") in_buffer

        count = 0
        do j = 1, len(in_buffer)
            char = in_buffer(j:j)
            if (scan(vowels, char) .ne. 0) then
                count = count + 1
            end if
        end do
        write (count_str, "(i20)") count

        ! Print to buffer
        if (i .eq. 1) then
            write (out_buffer, "(a)") adjustl(count_str) 
          else
            write (out_buffer, "(a,a,a)") trim(out_buffer), " ", adjustl(count_str)
          end if

    end do

    write (*, *) trim(out_buffer)

end program vowel_count
