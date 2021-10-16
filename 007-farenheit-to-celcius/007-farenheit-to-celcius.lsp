(ns fahrenheittocelsius.core
  (:gen-class))

(defn -main []
  (def fahrenheit [200 146 295 190 252 566 288 182 64 116 553 370 206 124 38 212 212 385 441 513 420 188 52 514 491 278 414 262 186 243 553 355 358 248 513])
  (def cels fahrenheit)
  (def answer fahrenheit)
  (defn fahr2cel [fahr j]
    (def celsius  (float(* (/ 5 9) (- fahr 32))))
    (def cels (assoc cels j celsius)))   
  (defn aproximar [numero j]
    (def umbralaprox 0.5)
    (def entero (int (* 1 numero)))
    (def decimal (- numero entero))
    (if (>= decimal umbralaprox) 
      (def entero (inc entero)))
    (if (<= decimal  (* -1 umbralaprox))
      (def entero (- entero 1)))
    (def answer (assoc answer j entero)))
  (dotimes [i (count fahrenheit)]
    (fahr2cel (fahrenheit i) i)
    (aproximar (cels i) i))
  (println "La respuesta es: " answer))
