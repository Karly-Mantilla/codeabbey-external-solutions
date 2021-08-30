;; $ clj-kondo --lint bridamo98.cljs
;; linting took 73ms, errors: 0, warnings: 0

(ns bridamo98-062
  (:gen-class)
  (:require [clojure.core :as core])
  (:require [clojure.string :as str])
  (:require [clojure.edn :as edn]))

(defn is-operator[pos-op]    
  (if (or (= (compare pos-op "add") 0) (= (compare pos-op "sub") 0)
  (= (compare pos-op "mul") 0) (= (compare pos-op "div") 0)
  (= (compare pos-op "mod") 0) (= (compare pos-op "sqrt") 0))
    (if (= (compare pos-op "sqrt") 0)
      [true 1]
      [true 2]
    )
    [false 0]
  )
)

(defn make-operation [op num1 num2]
  ;(println (str num1 " " op " " num2))
  (case (str op)
    "add" (+ num1 num2)
    "sub" (- num1 num2)
    "mul" (* num1 num2)
    "div" (/ num1 num2)
    "mod" (mod num1 num2)
    "sqrt" (Math/sqrt num1)
  )
)

(defn solve-exp [rpn-exp]
  (loop [i 0 stack (vector)]
    (if (< i (count rpn-exp))
      (let [params (is-operator (get rpn-exp i))]
        (if (params 0)
          (let [f-op (stack (- (count stack) (params 1)))
          s-op (stack (- (count stack) 1))
          result (make-operation (get rpn-exp i) f-op s-op)]
            ;(println "es operador")
            (recur (+ i 1) (conj (subvec stack 0 (- (count stack) (params 1))) result))
          )
          (do
            ;(println (get rpn-exp i))
            (recur (+ i 1) (conj stack (edn/read-string (get rpn-exp i))))
          )
        )
      )
      (int (stack 0))
    )
  )
)

(defn main []
  (let [rpn-exp (str/split (core/read-line) #" ")]
    (println (solve-exp rpn-exp))))

(main)