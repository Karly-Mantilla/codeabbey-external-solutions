(ns pr.core
  (:gen-class))

(use '[clojure.string :only (split)])
(use '[clojure.java.io :only (reader)])

(def filePath "DATA.lst")

(defn solution [X1 Y1 X2 Y2 X3 Y3]
  (def n (- (+(+(* X2 Y1) (* X3 Y2) (* X1 Y3))) (+(+(* X1 Y2) (* X2 Y3) (* X3 Y1))))
  )
  (if (< n 0)
  (def sol (* n -1)))
  (if (> n 0)
  (def sol (* n 1)))
  (if (= (rem sol 2) 0)
    (print (/ sol 2))
  )
  (if (not= (rem sol 2) 0)
    (print (float (/ sol 2)))
  )
)

(defn s2c [l]                                                                                                                                     
  (into [] (map #(Integer/parseInt %) (split l #" ")))                                                                             
)

(defn read_file                                                                                                                                    
  ([file]                                                                                                                                             
    (with-open [rdr (reader file)]                                                                                                    
      (doseq [line (line-seq rdr)]                                                                                                                    
        (let [c  (s2c line)                                                                                                                           
              s  (count c)                                                                                                                            
              X1  (get c 0)                                                                                                                            
              Y1  (get c 1)                                                                                                                            
              X2  (get c 2)                                                                                                                            
              Y2  (get c 3)                                                                                                                            
              X3  (get c 4)
              Y3  (get c 5)]                                                                                                                           
          (if (= s 6)                                                                                                                      
            (print (str (solution X1 Y1 X2 Y2 X3 Y3) " "))                                                                                                      
          )                                                                                                                                           
        )                                                                                                                                             
      )
    )
    (println)
  )
)

(defn -main [& args]
  (read_file "DATA.lst")
)
