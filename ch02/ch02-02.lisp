(defparameter *non-terminals*
  (map #'first *grammar*))

(defun generate (phrase)
  (cond ((listp phrase)
         (mappend #'generate phrase))
        ((member phrase (map #'first *grammar*))
         (generate (random-elt (rewrites phrase))))
        (t
         (list phrase))))
