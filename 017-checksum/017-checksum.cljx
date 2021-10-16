(define reduce ; outputs the result of the succesive application of (proc) on every 2 items of 'ls
  (lambda (proc ls)
    (cond
      ((or (null? ls) (null? (cdr ls))) 
        (display "Error: the input list must be at least 2 items long"))
      (else
       (letrec ((reduce-h
                 (lambda (proc ls)
                   (cond
                     ((null? (cdr ls)) (car ls))
                     (else
                      (reduce-h proc (cons (proc (car ls) (cadr ls)) (cddr ls))))))))
         (reduce-h proc ls))))))
         
(reduce (lambda (result next) (modulo (* 113 (+ result next)) 10000007)) 
    (cons 0 '(484040 130215 708018 98473546 77367 0 91784439 644235620 5834 2400683 394 952399 20 888 5 648948 227622426 58952319 597814517 490452 6415 232347 508450 92295519 6 47 755296 7828)))