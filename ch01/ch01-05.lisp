(defun dot-product (xs ys)
  (apply #'+ (mapcar #'* xs ys)))
