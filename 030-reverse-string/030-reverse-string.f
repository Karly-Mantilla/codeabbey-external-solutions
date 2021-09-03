program main
  implicit none
  character(len=64)  :: insen
  integer  :: ln, n

  open(10, file='input')
  read(10, '(A)') insen
  close(10)

  ln = len(trim(insen))
  do n = 1, ln
     print '(A, $)', insen(ln-n+1:ln-n+1)
  end do
  print *, ''

end program main