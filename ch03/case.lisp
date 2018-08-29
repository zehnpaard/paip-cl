(defvar x 1)

(case x
  (1 10)
  (2 20))

(typecase x
  (number (abs x))
  (list (length x)))
