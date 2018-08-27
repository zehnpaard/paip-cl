(defun count-atoms (xs)
  (if (atom xs)
    1
    (apply #'+ (mapcar #'count-atoms xs))))
