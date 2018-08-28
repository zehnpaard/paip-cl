(defun generate (phrase)
  (cond ((listp phrase)
         (mappend #'generate phrase))
        ((assoc phrase *grammar*)
         (generate (random-elt (rewrites phrase))))
        (t
         (list phrase))))
