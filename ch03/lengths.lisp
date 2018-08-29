(defun length1 (xs)
  (let ((len 0))
    (dolist (x xs)
      (incf len))
    len))

(defun length1.1 (xs)
  (let ((len 0))
    (dolist (x xs len)
      (incf len))))

(defun length2 (xs)
  (let ((len 0))
    (mapc #'(lambda (x) (incf len)) xs)
    len))

(defun length3 (xs)
  (do ((len 0 (+ len 1)) (ys xs (rest ys)))
    ((null ys) len)))

