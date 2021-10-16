(defun cat-tri (n)
  (loop repeat n
    for a = (expt (read) 2)
    for b = (expt (read) 2)
    for c = (expt (read) 2)
    collect (cond
          ((> c (+ a b)) 'O)
          ((< c (+ a b)) 'A)
          (t 'R))))
    