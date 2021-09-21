(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "(" line ")" )))))

(defun note-calculator (data)
  (let ((baseFreq) (freq) (notes) (noteStr) (noteList) (note) (octave))
    (setq notes '(C C# D D# E F F# G G# A A# B))
  

   (dolist (item data)
     (setq value (+ (* (+ (log (/ (* item 1024) 440) 2) (/ 1 24)) 12) 9))
     (setq note (nth (floor (mod value 12)) notes))
     (setq octave (floor (- (/ value 12) 6)))
     (format T "~%~D~D" note octave)
     )))

(defvar data)
(setq data (first (cdr (read-data))))
(note-calculator data)