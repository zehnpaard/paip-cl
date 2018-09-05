(defun mappend (fn xs)
  "Apply fn to each element of xs and append the results"
  (apply #'append (mapcar fn xs)))
