(defpackage #:codeabbey.simple-linear-regression
  (:use #:cl)
  (:export #:solve))
(in-package #:codeabbey.simple-linear-regression)

(defparameter *input*
  "1924 2013
1924: 138 459
1925: 119 385
1926: 144 439
1927: 139 429
1928: 108 362
1929: 55 282
1930: 56 240
1931: 57 239
1932: 124 443
1933: 148 493
1934: 92 292
1935: 81 288
1936: 126 408
1937: 130 410
1938: 132 451
1939: 110 420
1940: 97 407
1941: 87 309
1942: 67 289
1943: 137 452
1944: 96 334
1945: 134 415
1946: 75 278
1947: 67 263
1948: 103 398
1949: 55 226
1950: 106 289
1951: 97 330
1952: 100 332
1953: 92 317
1954: 72 244
1955: 129 427
1956: 132 463
1957: 73 278
1958: 142 453
1959: 96 313
1960: 142 439
1961: 83 320
1962: 131 413
1963: 56 224
1964: 58 213
1965: 78 302
1966: 148 462
1967: 142 455
1968: 142 432
1969: 128 407
1970: 61 198
1971: 89 311
1972: 149 457
1973: 56 237
1974: 100 344
1975: 124 390
1976: 114 384
1977: 94 321
1978: 82 302
1979: 131 417
1980: 145 451
1981: 80 280
1982: 86 295
1983: 110 347
1984: 94 328
1985: 61 207
1986: 90 327
1987: 61 193
1988: 98 333
1989: 91 321
1990: 87 311
1991: 77 282
1992: 94 349
1993: 120 393
1994: 60 267
1995: 125 441
1996: 142 439
1997: 108 355
1998: 117 341
1999: 58 237
2000: 111 382
2001: 85 354
2002: 119 391
2003: 112 371
2004: 69 268
2005: 142 401
2006: 103 385
2007: 116 374
2008: 127 407
2009: 66 258
2010: 115 402
2011: 68 266
2012: 56 211
2013: 115 372
")

(defun lin-reg (data)
  (multiple-value-bind (x-mean y-mean)
      (loop for (x . y) in data
            sum x into x-sum
            sum y into y-sum
            count t into count
            finally (return (values (/ x-sum count) (/ y-sum count))))
    (loop for (x . y) in data
          sum (* (- x x-mean) (- y y-mean)) into s-xy
          sum (let ((dx (- x x-mean))) (* dx dx)) into var-x
          finally (return (let* ((k (/ s-xy var-x))
                                 (b (- y-mean (* k x-mean))))
                            (values k b))))))

(defun string-split (str sep)
  (loop for start = 0 then (+ end (length sep))
        for end = (search sep str :start2 start)
        collect (subseq str start end)
        while end))

(defun solve ()
  (with-input-from-string (s *input*)
    (loop initially (read-line s)
          for line = (read-line s nil)
          while line
          for (year rest) = (string-split line ": ")
          collect (with-input-from-string (s2 rest)
                    (cons (read s2) (read s2)))
            into data
          finally (multiple-value-bind (k b) (lin-reg data)
                    (format t "~F ~F~%" k b)))))
