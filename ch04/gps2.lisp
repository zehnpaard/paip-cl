(defun executing-p (x)
  "Is x of the form+ (executing ...)?"
  (starts-with x 'executing))

(defun starts-with (xs x)
  "Is this a list whose first element is x?"
  (and (consp xs) (eql (first xs) x)))

(defun convert-op (op)
  "Make op conform to the (EXECUTING op) convention"
  (unless (some #'executing-p (op-add-list op))
    (push (list 'executing (op-action op)) (op-add-list op)))
  op)

(defun op (action 'key preconds add-list del-list)
  "Make a new operator that obeys the (EXECUTING op) convention"
  (convert-op
    (make-op :action action :preconds preconds
             :add-list add-list :del-list del-list)))
