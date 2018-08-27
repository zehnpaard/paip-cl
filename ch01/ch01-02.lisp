(defun exp* (x y)
  (if (= 0 y)
    1
    (* x (exp* x (- y 1)))))
