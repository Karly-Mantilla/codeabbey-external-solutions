(ns problem171.core
  (:gen-class)
  (:require [clojure.string :as str]))

(defn -main
  "Tree Height Measurement"
  [& args]
  (let [trees (Integer/parseInt (read-line))]
    (dotimes [_ trees]
      (let [[d b] (map read-string (str/split (read-line) #" "))
            a (Math/toRadians (- b 90))]
        (printf "%d " (Math/round (* d (Math/tan a)))))))
  (newline))