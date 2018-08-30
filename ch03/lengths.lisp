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

(defun length6.1 (xs)
  (loop with len = 0
        until (null xs)
        do (pop xs)
        do (incf len)
        finally (return len)))

(defun length7 (xs)
  (count-if #'true xs))
(defun true (x) t)

(defun length8 (xs)
  (if (null xs)
    0
    (+ 1 (position-if #'true xs :from-end t))))

(defun length9 (xs)
  (if (null xs)
    0
    (+ 1 (length9 (rest xs)))))

(defun length10 (xs)
  (length10-aux xs 0))
(defun length10-aux (xs n)
  (if (null xs)
    n
    (length10-aux (rest xs) (+ n 1))))

(defun length11 (xs &optional (n 0))
  (if (null xs)
    n
    (length11 (rest xs) (+ n 1))))

(defun length12 (xs)
  (labels
    ((length12-aux (xs n)
       (if (null xs)
         n
         (length12-aux (rest xs) (+ n 1)))))
    (length12-aux xs 0)))
