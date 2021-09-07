
(ns ludsrill.054
  (:gen-class)
  (:require [clojure.string :as str])
  (:require [clojure.core :as core]))

(defn get-data []
  (let [input-string (core/read-line)]
    (lazy-seq
      (if (seq input-string)
          (cons (str/split input-string #" ") (get-data))
          nil))))

(defn transpose [data]
  (if (> (count (first data)) 0)
    (let [primero (first data)
          segundo (second data)
          tercero (nth data 2)
          cuarto (nth data 3)]
      (cons (list (first primero) (first segundo) (first tercero) (first cuarto)) (transpose (list (rest primero) (rest segundo) (rest tercero) (rest cuarto)))))))
    
(defn add-zeros [item]
  (if (< (count item) 4)
    (add-zeros (concat item (list 0)))
    (first [item])))

(defn move-zeros [data]
  (if (= (count data) 4)
    (if (= (first data) 0)
      (if (not= (get (frequencies data) 0) 4)
        (add-zeros (remove #{0} data))
        (first [data]))
      (first [data]))
    (first [data])))
  
(defn rigth-left [data]
  (lazy-seq
    (let [data (move-zeros data)]
      (if (> (count data) 1)
        (if (> (count data) 2)
          (if (or (= (Integer. (first data)) (Integer. (second data))) (= (Integer. (first data)) 0))      
            (if (and (= (Integer. (first data)) 0) (= (Integer. (second data)) (Integer. (nth data 2))) (not= (Integer. (second data)) 0) (not= (Integer. (nth data 2)) 0))
              (cons (+ (Integer. (str (first data))) (Integer. (str (second data))) (Integer. (str (nth data 2)))) (rigth-left (list 0 0)))
              (cons (+ (Integer. (str (first data))) (Integer. (str (second data)))) (rigth-left (cons 0 (rest (rest data))))))
            (cons (first data) (rigth-left (rest data))))

          (if (or (= (Integer. (first data)) (Integer. (second data))) (= (Integer. (first data)) 0))      
              (cons (+ (Integer. (str (first data))) (Integer. (str (second data)))) (rigth-left (cons 0 (rest (rest data)))))
              (cons (first data) (rigth-left (rest data)))))  
  
          [(first data)]))))

(defn make-movm-right [data]
  (let [result (reverse (rigth-left (reverse (first data))))]
    (if (seq data)
      (cons result (make-movm-right (rest data))))))

(defn make-movm-left [data] 
  (let [result (rigth-left (first data))]
    (if (seq data)
      (cons result (make-movm-left (rest data))))))

(defn solution [data movements]
  (cond (= (count movements) 0) (first [data])
        (= (first movements) "D") (solution (transpose (make-movm-right (transpose data))) (rest movements))
        (= (first movements) "U") (solution (transpose (make-movm-left (transpose data))) (rest movements))
        (= (first movements) "R") (solution (make-movm-right data) (rest movements))
        (= (first movements) "L") (solution (make-movm-left data) (rest movements))))

(defn print-frequencie [data]
  (loop [x 2]
    (if (<= x (reduce max data))
      (do 
        (if (= (get (frequencies data) x) nil)
          (print "0 ")
          (print (core/format "%s " (get (frequencies data) x))))
        (recur (* x 2)))
      nil)))

(defn -main []
  (let [data (get-data)
        movements (last data)
        solutions (solution (reverse (rest (reverse data))) movements)]
    (print-frequencie (remove #{0} (apply concat solutions)))))

(-main)
