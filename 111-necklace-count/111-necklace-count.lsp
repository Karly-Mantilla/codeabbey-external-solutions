;;;; !Clojure!

(ns necklace-count)

(defn get-data
  []
  (loop [n (Integer/valueOf (read-line))
         data []]
    (if (zero? n)
      data
      (recur
       (dec n)
       (conj data (mapv #(. Integer valueOf %)
                        (clojure.string/split (read-line) #" ")))))))

(defn find-divisors
  [x]
  (if (= x 1)
    [1]
    (let [limit (inc (int (Math/ceil (Math/sqrt x))))]
      (loop [candidate 2
             divisors [1 x]]
        (cond
          (= candidate limit)
          (vec (sort (seq (set divisors))))
          (zero? (mod x candidate))
          (recur
           (inc candidate)
           (conj divisors candidate (/ x candidate)))
          :else
          (recur
           (inc candidate)
           divisors))))))

(defn gcd
  [a b]
  (let [[bigger smaller] (sort [a b])]
    (loop [bigger bigger
           smaller smaller]
      (let [remainder (rem bigger smaller)]
        (if (zero? remainder)
          smaller
          (recur
           smaller
           remainder))))))

(defn simple-totient
  [x]
  (loop [candidate 2
         totient 1]
    (cond
      (>= candidate x)
      totient
      (= (gcd candidate x) 1)
      (recur
       (inc candidate)
       (inc totient))
      :else
      (recur
       (inc candidate)
       totient))))

(defn necklace-count
  [[number-of-colors number-of-beads]]
  (loop [divisors (find-divisors number-of-beads)
         summation 0]
    (if (empty? divisors)
      (int (/ summation number-of-beads))
      (recur
       (rest divisors)
       (let [divisor (first divisors)]
         (+ summation (* (simple-totient divisor) (Math/pow number-of-colors (/ number-of-beads divisor)))))))))

(defn -main
  []
  (doseq [case (get-data)]
    (printf "%d " (necklace-count case)))
  (println))