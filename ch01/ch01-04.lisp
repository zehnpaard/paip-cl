(defun count-anywhere (x ys)
  (if (atom ys)
    (if (eq x ys) 1 0)
    (apply #'+ 
           (mapcar #'(lambda (y) 
                       (count-anywhere x y)) 
                   ys))))
