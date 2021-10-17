(define (con str ret cur)
  (if (= 0 (string-length str))
      (append ret (list (string->number cur)))
      (let ([q (substring str 0 1)])
        (if (equal? q " ")
            (con (substring str 1 (string-length str)) (append ret (list (string->number cur))) "")
            (con (substring str 1 (string-length str)) ret (string-append cur q))))))

(define (ssq ls ret)
  (if (= 0 (length ls))
      ret
      (ssq (cdr ls) (+ ret (* (car ls) (car ls))))))

(require 2htdp/batch-io)

(define (main ls ret)
  (if (= 0 (length ls))
      ret
      (main (cdr ls) (append ret (list (ssq (con (car ls) '() "") 0))))))

(main (read-lines "p.txt") '())