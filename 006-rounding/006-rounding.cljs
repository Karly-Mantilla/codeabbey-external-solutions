;; ! Clojure !

(ns rounding
  (:gen-class))

(defn get-n
  []
  (. Integer valueOf (read-line)))

(defn get-line
  []
  (map #(. Integer valueOf %) (clojure.string/split 
                           (read-line) #" ")))

(defn divide
 [[x y]]
 (/ x y))

(defn round
  [x]
  (if (< (- x 1/2) (. Math floor x))
      (int (. Math floor x))
      (int (. Math ceil x))))

(defn -main
  []
  (loop [n (get-n)]
    (if (zero? n)
        nil
        (do (printf "%d " (round (divide (get-line))))
            (recur (dec n))))))