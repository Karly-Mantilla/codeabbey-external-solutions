(defun fools-day-2014 (list)
  (reduce #'+ (mapcar (lambda (x)
                        (* x x))
                      list)))


(defun ljg-fools-day-2014 (file)
  (let ((temp (cdr (read-multi-lines-file file))))
    (setq temp (mapcar (lambda (str)
                         (mapcar #'string-to-int (split-string str)))
                       temp))
    (mapcar #'fools-day-2014 temp)))