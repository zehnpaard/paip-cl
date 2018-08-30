(mapcar #'- '(1 2 3)) ;'(-1 -2 -3)
(mapcar #'+ '(1 2) '(10 20)) ; '(11 22)
(mapcar #'+ '(1 2) '(10 20) '(100 200)) ;'(111 222)

(remove 1 '(1 2 3 2 1 0 -1)) ;'(2 3 2 0 -1)
(remove 1 '(1 2 3 2 1 0 -1) :key #'abs) ;'(2 3 2 0)
(remove 1 '(1 2 3 2 1 0 -1) :test #'<) ;'(1 1 0 -1)
(remove 1 '(1 2 3 2 1 0 -1) :start 4) ;'(1 2 3 2 0 -1)

(remove-if #'oddp '(1 2 3 2 1 0 -1)) ;'(2 2 0)
(remove-if-not #'oddp '(1 2 3 2 1 0 -1)) ;'(1 3 1 -1)
(find-if #'evenp '(1 2 3 2 1 0 -1)) ;2
