(defun length (xs)
  (reduce #'(lambda (y x) (+ 1 y)) xs :initial-value 0))
