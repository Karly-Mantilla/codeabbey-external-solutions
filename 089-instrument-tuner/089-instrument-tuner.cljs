;;; !Clojure!

(ns tuner)

(def notes
  ["C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B"])

(def c0
  (/ (* 440M (Math/pow 2 1/4)) 32M))

(def low-octave
  {"C" c0
   "C#" (* c0 (Math/pow 2 1/12))
   "D" (* c0 (Math/pow 2 1/6))
   "D#" (* c0 (Math/pow 2 1/4))
   "E" (* c0 (Math/pow 2 1/3))
   "F" (* c0 (Math/pow 2 5/12))
   "F#" (* c0 (Math/pow 2 1/2))
   "G" (* c0 (Math/pow 2 7/12))
   "G#" (* c0 (Math/pow 2 2/3))
   "A" (* c0 (Math/pow 2 3/4))
   "A#" (* c0 (Math/pow 2 5/6))
   "B" (* c0 (Math/pow 2 11/12))})

(def first-octave-limit
  (* c0 (Math/pow 2 23/24)))

(defn discard-n
  []
  (read-line))

(defn get-data
  []
  (discard-n)
  (map bigdec (clojure.string/split (read-line) #" ")))

(defn find-closest-pitch
  [frequency]
  (loop [octave 0
         frequency frequency]
    (if (< frequency first-octave-limit)
      (format "%s%d" (key (apply min-key #(. Math abs (- (val %) frequency))
                                 low-octave))
                       octave)
        (recur
         (inc octave)
         (/ frequency 2M)))))

(defn -main
  []
  (doseq [frequency (get-data)]
    (printf "%s " (find-closest-pitch frequency)))
  (println))