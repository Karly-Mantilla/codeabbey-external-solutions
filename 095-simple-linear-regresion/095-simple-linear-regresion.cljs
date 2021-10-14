;;; !Clojure!

; We are searching for the values of alpha-hat and beta-hat in the following expression:
; y = (betahat)x + alphahat   (hat=estimate). In our problem, alphahat is B
; and betahat is K; D is x and P is y.
; alphahat = ybar - (betahat)xbar (bar=mean)
; betahat = r[xy](s[y]/s[x]). r[xy] is the sample correlation coefficient.
; s[y] and s[x] are the uncorrected sample standard deviations of y and x
; respectively. 
; r[xy] = ((xy)bar - (xbar)(ybar))/sqrt (((x)bar - (xbar))((y)bar - (ybar)))
; So, in terms of the variable names of the problem, we have
; P = Kx + B
; B = Pbar - K*Dbar
; K = r[DP](s[D]/s[P)
; r[DP] = ((DP)bar - (Dbar)(Pbar))/sqrt (((D)bar - (Dbar)((P)bar - (Pbar)))

(ns slr)

(defn get-n
  []
  (let [years
        (map #(. Integer valueOf %)
             (clojure.string/split
              (read-line)
              #" "))]
    (- (second years) (first years))))

(defn get-data  []
  (loop [n (get-n)
         data []]
    (if (neg? n)
        data
        (recur
         (dec n)
         (conj data
               (vec
                (map
                 #(. Float valueOf %)
                 (rest
                  (clojure.string/split
                   (read-line)
                   #" ")))))))))

(defn find-all-Ds
  [data-vec]
  (mapv first data-vec))

(defn find-all-Ps
  [data-vec]
  (mapv second data-vec))

(defn calc-mean
  [number-vec]
  (/ (apply + number-vec) (count number-vec)))

(defn calc-sd
  [number-vec]
  (let [var-bar (calc-mean number-vec)]
    (Math/sqrt
     (calc-mean
      (map #(. Math pow (- var-bar %) 2)
           number-vec)))))

(defn calc-DP-bar
  [data-vec]
  (calc-mean
   (map
    (fn [[D P]] (* D P))
    data-vec)))

(defn calc-var-squared-bar
  [number-vec]
  (calc-mean
   (map
    #(. Math pow % 2)
    number-vec)))

(defn calc-r
  [data-vec]
  (let [Ds (find-all-Ds data-vec)
        Ps (find-all-Ps data-vec)
        D-bar (calc-mean Ds)
        P-bar (calc-mean Ps)
        DP-bar (calc-DP-bar data-vec)
        D-squared-bar (calc-var-squared-bar Ds)
        P-squared-bar (calc-var-squared-bar Ps)]
    (/ (- DP-bar (* D-bar P-bar)) 
       (Math/sqrt (* (- D-squared-bar (* D-bar D-bar))
                     (- P-squared-bar (* P-bar P-bar)))))))

(defn calc-K
  [data-vec]
  (let [r (calc-r data-vec)
        Ps (find-all-Ps data-vec)
        Ds (find-all-Ds data-vec)
        sd-P (calc-sd Ps)
        sd-D (calc-sd Ds)]
    (* r (/ sd-P sd-D))))

(defn calc-B
  [data-vec]
  (let [Ps (find-all-Ps data-vec)
        Ds (find-all-Ds data-vec)
        P-bar (calc-mean Ps)
        D-bar (calc-mean Ds)
        K (calc-K data-vec)]
    (- P-bar (* K D-bar))))

(defn -main
  []
  (let [data-vec (get-data)]
    (printf "%.9f %.9f\n" (calc-K data-vec) (calc-B data-vec))))