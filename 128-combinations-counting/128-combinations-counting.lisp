(defun combinations-counting (list)
  (defun fact (x)
    (if (or (= x 0) (= x 1))
        1
      (calc-eval "$*$$" nil x (fact (1- x)))))
  (let ((n (car list))
        (k (cadr list)))
    (setq temp (calc-eval "$*$$" nil (fact k) (fact (- n k))))
    (setq result (calc-eval "$/$$" nil (fact n) temp))
    (princ result)
    (princ " ")))


(defun ljg-combinations-counting-solution (file)
  (let ((temp (cdr (read-multi-lines-file file))))
    (setq temp (mapcar (lambda (str)
                         (mapcar #'string-to-int (split-string str)))
                       temp))
    (mapc #'combinations-counting temp)))