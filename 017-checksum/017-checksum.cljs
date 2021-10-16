#|
  $ sblint -v bridamo98.lsp
    [INFO] Lint file bridamo98.lsp
  $ clisp -c bridamo98.lsp
    Compiling file <file-location>/bridamo98.lsp ...
    Wrote file <file-location>/bridamo98.fas
    0 errors, 0 warnings
    Bye.
|#

(defun delimiterp (c)
  (char= c #\Space))

(defun split (string &key (delimiterp #'delimiterp))
  (loop
    :for beg = (position-if-not delimiterp string)
    :then (position-if-not delimiterp string :start (1+ end))
    :for end = (and beg (position-if delimiterp string :start beg))
    :when beg :collect (subseq string beg end)
    :while end))

(defun solve(size-input data)
  (let ((result 0))
    (loop for i from 0 to (- size-input 1)
      do(setq result (mod (* (+ result
      (parse-integer (nth i data))) 113) 10000007)))
    (return-from solve result)))

(defun main ()
  (let ((size-input (read)) (data (read-line)))
    (format t "~a "(solve size-input (split data)))))

(main)
