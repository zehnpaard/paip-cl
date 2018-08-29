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

(defun length4 (xs)
  (loop for element in xs
        count t))

(defun length4.1 (xs)
  (loop for e = (pop xs)
        count t
        until (null xs)))

(defun length5 (xs)
  (loop for element in xs
        summing 1))

(defun length5.1 (xs)
  (loop do (pop xs)
        summing 1
        until (null xs)))

(defun length6 (xs)
  (loop with len = 0
        until (null xs)
        for e = (pop xs)
        do (incf len)
        finally (return len)))
