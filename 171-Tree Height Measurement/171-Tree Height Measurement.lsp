(defun degrees_to_radians (degrees) 
  (* pi (/ degrees 180.0))
)

(defun calc_height(distance angle height)
  (setq height (round (* distance (tan (- (degrees_to_radians angle) (degrees_to_radians 90))))))
  (format t "~a " height)
)

(defun solve(size_input distances angles)
  (defvar height 0)
  (loop for x from 0 to (- size_input 1)
    do(calc_height (aref distances x) (aref angles x) height)
  )
)

(defun get_data(x number distances angles)
  (setq number (read))
  (setf (aref distances x) number)
  (setq number (read))
  (setf (aref angles x) number) 
)

(defvar size_input (read))
(defparameter distances (make-array size_input))
(defparameter angles (make-array size_input))
(defvar number 0)

(loop for x from 0 to (- size_input 1)
  do(get_data x number distances angles)
)

(solve size_input distances angles)

;cat DATA.lst | clisp bridamo98.lsp
;1 2 3 3 4 5 4 3 2 4 9 8 1 10 12 14 1 17 14 19 19 16 10 0 7 11 11 9 14 15 8
