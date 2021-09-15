;;;; !Clojure!

(ns matches-picking)

(defn get-data
  []
  (loop [n (Integer/valueOf (read-line))
         data []]
    (if (zero? n)
      data
      (let [line (clojure.string/split (read-line) #" ")]
        (recur
         (dec n)
         (conj data [(Integer/valueOf (first line))
                     (Integer/valueOf (second line))
                     (last line)]))))))

(defn solve-normal
  [[m k _]]
  (mod m (inc k)))

(defn solve-inverted
  [[m k _]]
  (mod (dec m) (inc k)))

(defn solve-match-puzzle
  [[_ _ type :as case]]
  (if (= type "n")
    (solve-normal case)
    (solve-inverted case)))

(defn -main
  []
  (doseq [case (get-data)]
    (print (solve-match-puzzle case) ""))
  (println))