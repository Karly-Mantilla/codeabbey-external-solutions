#lang racket

(define in-port
    (open-input-file
        (vector-ref 
            (current-command-line-arguments) 
            0)))

(define (get-checksum in-port)
    (define (get-nums)
        (define init-count (read in-port))

        (define (get-nums-iter count lst)
            (define next-lst (cons (read in-port) lst))

            (if (= count 1)
                next-lst
                (get-nums-iter
                    (- count 1)
                    next-lst
                )
            )
        )

        (get-nums-iter init-count '())
    )

    (define (calc-checksum lst)
        (define (calc-checksum-iter checksum lst)
            (if (empty? lst)
                checksum
                (calc-checksum-iter
                    (modulo (* (+ (car lst) checksum) 113) 10000007)
                    (cdr lst)
                )
            )
        )

        (calc-checksum-iter 0 lst)
    )

    (calc-checksum (reverse (get-nums)))
)

(display (get-checksum in-port))
(newline)