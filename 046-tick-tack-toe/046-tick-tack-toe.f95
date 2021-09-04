 tic tac toe
! by Frank Gomes
! AP Create task

program tictactoe
  ! Disable implicit typing
  implicit none
  ! 2D array for the grid
  character, dimension(3, 3) :: grid
  ! Value to hold raw, uninterpreted user input
  character (len = 4) :: input
  ! Values to hold position to mark
  integer :: x
  integer :: y
  ! Counter of how many loops there have been
  integer :: loops
  ! Array to hold move history
  integer, dimension(9, 2) :: history
  ! Initialize grid as empty spaces
  grid = reshape((/ ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' /), (/ 3, 3 /))
  ! Start loop counter at 1
  loops = 1
  ! Welcome banner
  print *,"Welcome to Tic Tac Toe!"
  ! Explain to user how to input position
  print *,"To enter your choice, enter the number of the column and the letter of the row."
  ! Explain to user how to quit
  print *,"To exit, type 'exit'."
  ! Loop infinitely and take a move every time
  do
    ! Print grid
    call show(grid)
    ! User's next move
    print *,"Make your move."
    ! Store input in string to interpret
    read *,input
    ! Check if user wants to quit
    if (input == 'exit') then
      print *,"Goodbye!"
      stop 
    end if
    ! Set the x variable to the first number in the input
    read (input(1:1),'(i4)') x
    ! Choose which y coordinate to use based on the character the user input
    select case (input(2:2))
      case ('a')
        y = 1
      case ('b')
        y = 2
      case ('c')
        y = 3
      case default
        print *,"That was not a valid input. Try again."
        cycle
    end select
    ! Check if the column selection was valid
    if (x > 3) then
      print *,"That is not a valid column. Try again."
      cycle
    end if
    if (x < 1) then
      print *,"That is not a valid column. Try again."
      cycle
    end if
    ! Check if area has already been marked
    if (grid(y, x) == 'x') then
      print *,"You have already marked there. Try again."
      cycle
    end if
    ! Add move to the history of moves
    history(loops, 1) = x
    history(loops, 2) = y
    ! Mark 'x' at the location the position input
    grid(y, x) = 'x'
    ! Check if user won on this move
    if (grid(1,1) == 'x') then
      if (grid(2,1) == 'x') then
        if (grid(3,1) == 'x') then
          call win(grid)
        end if
      end if
      if (grid(2,2) == 'x') then
        if (grid(3,3) == 'x') then
          call win(grid)
        end if
      end if
      if (grid(1,2) == 'x') then
        if (grid(1,3) == 'x') then
          call win(grid)
        end if
      end if
    end if
    if (grid(1,2) == 'x') then
      if (grid(2,2) == 'x') then
        if (grid(3,2) == 'x') then
          call win(grid)
        end if
      end if
    end if
    if (grid(1,3) == 'x') then
      if (grid(2,3) == 'x') then
        if (grid(3,3) == 'x') then
          call win(grid)
        end if
       end if
    end if
    if (grid(2,1) == 'x') then
      if (grid(2,2) == 'x') then
        if (grid(3,2) == 'x') then
          call win(grid)
        end if
      end if
    end if
    if (grid(3,1) == 'x') then
      if (grid(3,2) == 'x') then
        if (grid(3,3) == 'x') then
          call win(grid)
        end if
      end if
    end if
    ! "AI" that chooses where to move
    ! TODO: "AI"
    ! Move center if not already occupied
    if (grid(2,2) == ' ') then
      grid(2,2) = 'o'
      cycle
    end if
    ! Check if AI won
    if (grid(1,1) == 'o') then
      if (grid(2,1) == 'o') then
        if (grid(3,1) == 'o') then
          call lose(grid)
        end if
      end if
      if (grid(2,2) == 'o') then
        if (grid(3,3) == 'o') then
          call lose(grid)
        end if
      end if
      if (grid(1,2) == 'o') then
        if (grid(1,3) == 'o') then
          call lose(grid)
        end if
      end if
    end if
    if (grid(1,2) == 'o') then
      if (grid(2,2) == 'o') then
        if (grid(3,2) == 'o') then
          call lose(grid)
        end if
      end if
    end if
    if (grid(1,3) == 'o') then
      if (grid(2,3) == 'o') then
        if (grid(3,3) == 'o') then
          call lose(grid)
        end if
       end if
    end if
    if (grid(2,1) == 'o') then
      if (grid(2,2) == 'o') then
        if (grid(3,2) == 'o') then
          call lose(grid)
        end if
      end if
    end if
    if (grid(3,1) == 'o') then
      if (grid(3,2) == 'o') then
        if (grid(3,3) == 'o') then
          call lose(grid)
        end if
      end if
    end if
    ! Increment loop counter
    loops = loops + 1
  end do
end program tictactoe

! Subroutines for winning and losing
subroutine win(grid)
  character, dimension(3, 3) :: grid
  print *,"You win!"
  call show(grid)
  stop
end subroutine win

subroutine lose(grid)
  character, dimension(3, 3) :: grid
  print *,"The computer wins!"
  stop
end subroutine lose

! Subroutine to print the grid
subroutine show(grid)
  character, dimension(3, 3) :: grid
  print *,""
  print *," 123"
  print *,'a',grid(1, 1), grid(1, 2), grid(1, 3)
  print *,'b',grid(2, 1), grid(2, 2), grid(2, 3)
  print *,'c',grid(3, 1), grid(3, 2), grid(3, 3)
end subroutine show




