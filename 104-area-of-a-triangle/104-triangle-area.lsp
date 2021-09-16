(define (l2 x1 y1 x2 y2)
  (let ([x (- x2 x1)] [y (- y2 y1)])
    (+ (* x x) (* y y))))

(define (area x1 y1 x2 y2 x3 y3)
  (let ([a2 (l2 x1 y1 x2 y2)] [b2 (l2 x1 y1 x3 y3)] [c2 (l2 x2 y2 x3 y3)])
    (let ([A (* 4 a2 b2)] [B (+ a2 b2 (* -1 c2))])
      (exact->inexact (/ (sqrt (- A (* B B))) 4)))))

(define (main ls ret)
  (if (= 0 (length ls))
      ret
      (main (list-tail ls 6) (append ret (list (area (list-ref ls 0)
                                                     (list-ref ls 1)
                                                     (list-ref ls 2)
                                                     (list-ref ls 3)
                                                     (list-ref ls 4)
                                                     (list-ref ls 5)))))))

(define (con ls ret)
  (if (= 0 (length ls))
      ret
      (con (cdr ls) (append ret (list (string->number (car ls)))))))

(require 2htdp/batch-io)

(main (con (read-words "p.txt") '()) '())