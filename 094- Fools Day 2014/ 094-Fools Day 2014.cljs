(defpackage #:codeabbey.fools-day-2014
  (:use #:cl)
  (:export #:solve))
(in-package #:codeabbey.fools-day-2014)

(defparameter *input*
  "18
4 8 10
1 4 9 14 19
5 7 12 14 18
3 8 11 14 19 24
3 5 7 11
5 8
4 9 12
1 6 8
4 8 13 18 22 27 30
2 5 9
1 4 9 13 17
2 6 11 15 20 24 28
4 8 10 15
5 8 11 15 20
1 3 7
4 6 9
5 7
5 8 11 16 21 24
")

(defun solve ()
  (with-input-from-string (s *input*)
    (loop with n = (read s)
          repeat n
          collect (with-input-from-string (s2 (read-line s))
                    (loop for num = (read s2 nil)
                          while num
                          sum (* num num)))
            into answers
          finally (format t "~{~A~^ ~}~%" answers))))