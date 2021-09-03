;;; Rock paper Scissors

(defparameter player-score 0)
(defparameter computer-score 0)
(defparameter total-rounds 0)
(defparameter game-round 0)

(defun prompt()
  (format t "Please enter your play (rock / paper / scissors): ")
  (force-output)
  (let ((play (string-downcase (read-line))))
    (if (or (string= play "rock")
            (string= play "paper")
            (string= play "scissors"))
        play
        (prompt))))

(defun computer-play ()
  (let ((number (random 3 (make-random-state t))))
    (cond
      ((= number 0) '"rock")
      ((= number 1) '"paper")
      ((= number 2) '"scissors"))))

(defun winner (play1 play2)
  ; (format t "Play 1: ~A   Play 2: ~A~%" play1 play2)
  (cond
    ((and (string= play1 "rock") (string= play2 "rock")) "draw")
    ((and (string= play1 "rock") (string= play2 "paper")) "computer")
    ((and (string= play1 "rock") (string= play2 "scissors")) "player")
    ((and (string= play1 "paper") (string= play2 "rock")) "player")
    ((and (string= play1 "paper") (string= play2 "paper")) "draw")
    ((and (string= play1 "paper") (string= play2 "scissors")) "computer")
    ((and (string= play1 "scissors") (string= play2 "rock")) "computer")
    ((and (string= play1 "scissors") (string= play2 "paper")) "player")
    ((and (string= play1 "scissors") (string= play2 "scissors")) "draw")
    ))

(defun single-game ()
  (winner (prompt) (computer-play)))

(defun game ()
  (setf game-round 0)
  (setf player-score 0)
  (setf computer-score 0)
  (format t "Rock Paper Scissors~%~%")
  (format t "How many rounds do you want to play? ")
  (force-output)
  (let ((total-rounds (parse-integer (read-line))))
    (loop while (< game-round total-rounds)
          do (incf game-round)
             (format t "Round ~A~%" game-round)
             (let ((result (single-game)))
               (if (string= result "draw")
                   (format t "It's a Draw~%")
                   (if (string= result "player")
                       (progn
                         (incf player-score)
                         (format t "You Win!~%"))
                       (progn
                         (incf computer-score)
                         (format t "You Loose~%"))))))
    (format t "~%Scores~%Player: ~A    Computer: ~A~%" player-score computer-score)))