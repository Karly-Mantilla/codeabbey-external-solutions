(defn to-fahrenheit [x] (->> (- x 32)
                             (* (/ 5 9))
                             (double)
                             (Math/round)))

(println (map to-fahrenheit testinput))