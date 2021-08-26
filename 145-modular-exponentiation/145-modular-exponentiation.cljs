;; $ clj-kondo --lint bridamo98.cljs
;; linting took 71ms, errors: 0, warnings: 0

(ns bridamo98-027
  (:gen-class)
  (:require [clojure.core :as core])
  (:require [clojure.string :as str])
  (:require [clojure.edn :as edn]))

(defn calc-iteration [a b m] (mod (* a b) m))

(defn powerMod [a b m]
  (loop [a a, b b, x 1]
    (if (zero? b) x
      (if (even? b) (recur (calc-iteration a a m) (/ b 2) x)
        (recur (calc-iteration a a m) (quot b 2) (calc-iteration a x m))))))

(defn solve-all [size-input]
  (loop [i 0 result ""]
    (if (< i size-input)
      (let [problem (str/split (core/read-line) #" ")
      a (edn/read-string (get problem 0))
      b (edn/read-string (get problem 1))
      m (edn/read-string (get problem 2))]
        (recur (+ i 1)
        (str result (powerMod a b m) " ")))
      result)))

(defn main []
  (let [size-input (edn/read-string (core/read-line))]
    (println (solve-all size-input))))

(main)