(defun line->numbers(l)
    (with-input-from-string (input l)
        (loop for n = (read input nil) while n collect n)))

(dotimes (n (read))
    (let ((sum 0))
        (dolist (x (line->numbers(read-line)))
            (setq sum (+ sum (expt x 2))))
        (format t "~a " sum)))
