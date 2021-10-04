(defun chance (pa pb)
  (loop for n upto 200
    sum (* pa
           (expt (- 1 pa) n)
           (expt (- 1 pb) n))))

(defun abbey-round (n)
  (if (>= (- n (truncate n)) 0.4999)
      (ceiling n)
      (floor n)))

(defun chance-n (n)
  (let ((*read-default-float-format* 'long-float))
    (loop repeat n
      collect (abbey-round
           (* 100 (chance (/ (read) 100)
                  (/ (read) 100)))))))