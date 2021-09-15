#|
  $ sblint -v bridamo98.lsp
    [INFO] Lint file bridamo98.lsp
  $ clisp -c bridamo98.lsp
    Compiling file <file-location>/bridamo98.lsp ...
    Wrote file <file-location>/bridamo98.fas
    0 errors, 0 warnings
    Bye.
|#



(defun find-matches-picking (m k case)
  (let ((reminder (mod m (+ k 1))))
    (if (string= case "I")
      (if (= reminder 0)
        k
        (- reminder 1)
      )
      reminder
    )
  )
)

(defun solve-all-problems (i-case-counter)
  (if (> i-case-counter 0)
    (progn
      (format t "~a " (find-matches-picking (read) (read) (read)))
      (solve-all-problems  (- i-case-counter 1))
    )
  )
)

(defun main ()
  (let ((size-input (read)))
    (solve-all-problems size-input)
  )
)

(main)

#|
  cat DATA.lst | clisp bridamo98.lsp
  0 5 0 5 14 2 4 15 4 7 2 3 1 5 0 5 3 2 0 5 1 0 8 1 8 9 9
|#