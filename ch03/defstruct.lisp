(defstruct player (score 0) (wins 0))

(defun determine-winner (players)
  "Increment the wins for the player with highest score"
  (let ((winner (first (sort players #'> :key #'player-score))))
    (incf (player-wins winner))))
