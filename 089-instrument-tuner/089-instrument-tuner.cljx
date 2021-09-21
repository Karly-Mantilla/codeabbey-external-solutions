(defpackage #:codeabbey.instrument-tuner
  (:use #:cl)
  (:export #:solve))
(in-package #:codeabbey.instrument-tuner)

(defparameter *input*
  "18
737.0 39.6 118.3 545.5 308.9 587.9 48.6 144.9 138.0 176.5 41.6 57.2 370.7 419.9 108.5 221.1 36.8 34.2
")

(defconstant +a4-pitch+ 440)

(defparameter *notes* '("C" "C#" "D" "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B"))

(defparameter *a-pos* (position "A" *notes* :test #'string=))

(defun diff-from-a4 (freq)
  (* 12 (log (/ freq +a4-pitch+) 2)))

(defun octave-and-note-from-diff (diff)
  (let* ((octave-diff (floor (+ diff *a-pos*) 12))
         (note-diff (mod diff 12))
         (octave (+ 4 octave-diff))
         (note-pos (mod (+ *a-pos* (round note-diff)) (length *notes*))))
    (format nil "~A~A" (nth note-pos *notes*) octave)))

(defun note (freq)
  (octave-and-note-from-diff (diff-from-a4 freq)))

(defun solve ()
  (with-input-from-string (s *input*)
    (loop repeat (read s)
          for freq = (read s)
          collect (note freq) into answers
          finally (format t "~{~A~^ ~}~%" answers))))