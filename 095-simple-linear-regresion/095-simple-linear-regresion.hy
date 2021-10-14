;Find slope:
(defn findSlope[xyValues]
  (setv xValues (get xyValues 0))
  (setv yValues (get xyValues 1))
  (setv xMean (calculateMeans xValues))
  (setv yMean (calculateMeans xValues))
  (setv size (len xValues))

  (do
    (loop[[i 0] [numerator 0] [denominator 0]]
      (if (>= i size)
        (/ numerator denominator)
        (recur
          (inc i)
          (+ numerator (* (- (get xValues i) xMean) (- (get yValues i) yMean)))
          (+ denominator (pow (- (get xValues i) xMean) 2)))))))