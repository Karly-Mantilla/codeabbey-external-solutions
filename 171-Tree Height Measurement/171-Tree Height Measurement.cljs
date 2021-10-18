;; ! Clojure !

(ns tree-height)

(defn get-n
  []
  (Integer/valueOf (read-line)))

(defn get-case
  []
  (map bigdec (clojure.string/split (read-line) #" ")))

(defn calculate-height
  [[distance raw-angle]]
  (* distance (Math/tan (Math/toRadians (- raw-angle 90)))))

(defn -main
  []
  (loop [n (get-n)]
    (if (zero? n)
        (print "\nDONE!\n")
        (do
          (printf "%.0f " (calculate-height (get-case)))
          (recur (dec n))))))