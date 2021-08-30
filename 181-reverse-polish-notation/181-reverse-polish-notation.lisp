(defpackage #:codeabbey.reverse-polish-notation
  (:use #:cl)
  (:export #:solve))
(in-package #:codeabbey.reverse-polish-notation)

(defparameter *input*
  "3691 51003 add 22 11 div mul 4203 add 2790766 490989 mod 458868 add add 525 4086 17477 add add 35 5 div 36 18 div sub mul 148 17 mul 29277 8349 mod add 3565 add add mod 8588 2614 add 3925 add 352 62 mod 8 2 sub div mul 87901 21380 add 372 56 add add 15691 mod mod 464655 101116 mod 6578 2676 add mod 772 164 mod 91 13 div mul mod 742 462 sub 17 3 sub div 2366 14 div 13 div sub mul add mod 422 84 46 sub 32 2 sub add 254 149 sub 31 16 sub div mul 29 2 mul 153 add 51 2 add 4 2 sub mul add sub sub 7 mul mod 24 372 148 sub 10 2 sub div 322 623 add 16 7 sub div add 15 9 sub 5 3 sub sub sqrt mul 160 96 sub 273 13 div add 343 7 mul sqrt sub 17 sub div sub 467 364 add 13 11 mul mod 494 109 mod sub 62 add 108 2 mul 324 2 mul 324 sqrt div 18 sub div div 66 438 3 add sqrt sub 67 15 29 add sub sub 449 168 mod 33 11 div mul 218 sub sqrt div div sub mul 864 34 16 sub div 1380 3103 add 764 2 mul add 529 3 mul mod 60 25 add 7 2 sub mul 23 164 add 21 9 sub add sub mod 576 sqrt 944 144 mod 56 7 div div 18 11 sub 2 sub div div div add 2815 730 mod sqrt 15 3 sub 64 sqrt sub sqrt mul 10 3 sub add 2193 4772 423 3938 add 1116 98 add mod mod mod sqrt div mul 427 191 sub 2 mul 20162 7041 add 1800 6718 add add sqrt 7 div 9 sub 484 sqrt 13 sub div mul add mod")

(defun calc (str)
  (flet ((bin-op (op a b)
           (ecase op
             (add (+ a b))
             (sub (- a b))
             (mul (* a b))
             (div (floor a b))
             (mod (mod a b)))))
    (with-input-from-string (s str)
      (loop with stack
            with *package* = (symbol-package '*input*)
            for token = (read s nil)
            while token
            do (cond ((numberp token) (push token stack))
                     (t (ecase token
                          ((add sub mul div mod)
                           (let ((b (pop stack))
                                 (a (pop stack)))
                             (push (bin-op token a b) stack)))
                          (sqrt (push (isqrt (pop stack)) stack)))))
            finally (return (first stack))))))

(defun solve ()
  (format t "~A~%" (calc *input*)))