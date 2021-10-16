(defpackage #:codeabbey.fahrenheit-celsius
  (:use #:cl)
  (:export #:solve))
(in-package #:codeabbey.fahrenheit-celsius)

(defparameter *input*
  "38 57 485 522 243 401 267 323 296 364 245 135 275 593 404 121 145 428 556 191 290 170 368 551 417 454 366 385 45 188 160 503 213 44 425 425 414 91 148")

(defun solve ()
  (let ((answers (with-input-from-string (s *input*)
                   (loop with n = (read s)
                         repeat n
                         for f = (read s)
                         collect (round (* 5/9 (- f 32)))))))
    (format t "~{~A~^ ~}~%" answers)))