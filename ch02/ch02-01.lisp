(defun generate (phrase)
  (let (choices (rewrites phrase))
    (cond ((listp phrase)
           (mappend #'generate phrase))
          (choices
           (generate (random-elt choices)))
          (t
           (list phrase)))))
