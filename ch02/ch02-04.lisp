(defun cross-product (f xlist ylist)
  (mappend #'(lambda (y)
               (mapcar #'(lambda (x) (funcall f x y))
                       xlist))
           ylist))

(defun combine-all (xlist ylist)
  (cross-product #'append xlist ylist))
