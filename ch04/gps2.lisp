(load "find-all.lisp")
(load "dbg1.lisp")

(defvar *ops* nil
  "A list of available operators")

(defstruct op "An operation"
  (action nil) (preconds nil) (add-list nil) (del-list nil))

(defun starts-with (xs x)
  "Is this a list whose first element is x?"
  (and (consp xs) (eql (first xs) x)))

(defun executing-p (x)
  "Is x of the form+ (executing ...)?"
  (starts-with x 'executing))

(defun convert-op (op)
  "Make op conform to the (EXECUTING op) convention"
  (unless (some #'executing-p (op-add-list op))
    (push (list 'executing (op-action op)) (op-add-list op)))
  op)

(defun op (action &key preconds add-list del-list)
  "Make a new operator that obeys the (EXECUTING op) convention"
  (convert-op
    (make-op :action action :preconds preconds
             :add-list add-list :del-list del-list)))

(defun member-equal (item xs)
  (member item xs :test #'equal))

(defun appropriate-p (goal op)
  "An op is appropriate to a goal if it is in its add-list"
  (member-equal goal (op-add-list op)))

(defun achieve (state goal goal-stack)
  "A goal is achieved if it already holds,
  or if there is an appropriate op for it that is applicable."
  (dbg-indent :gps (length goal-stack) "Goal: ~a" goal)
  (cond ((member-equal goal state) state)
        ((member-equal goal goal-stack) nil)
        (t (some #'(lambda (op) (apply-op state goal op goal-stack))
                 (find-all goal *ops* :test #'appropriate-p)))))

(defun achieve-all (state goals goal-stack)
  "Achieve each goal, and make sure they still hold at the end"
  (let ((current-state state))
    (if (and (every #'(lambda (g)
                        (setf current-state
                              (achieve current-state g goal-stack)))
                    goals)
             (subsetp goals current-state :test #'equal))
      current-state)))

(defun apply-op (state goal op goal-stack)
  "Return a new, transformed state if op is applicable"
  (dbg-indent :gps (length goal-stack) "Consider: ~a" (op-action op))
  (let ((state2 (achieve-all state (op-preconds op)
                             (cons goal goal-stack))))
    (unless (null state2)
      ;; Return an updated state
      (dbg-indent :gps (length goal-stack) "Action: ~a" (op-action op))
      (append (remove-if #'(lambda (x)
                             (member-equal x (op-del-list op)))
                         state2)
              (op-add-list op)))))

(defun GPS (state goals &optional (*ops* *ops*))
  "General Problem Solver: from state, achieve goals using *ops*"
  (remove-if #'atom (achieve-all (cons '(start) state) goals nil)))


(defun use (oplist)
  "Use oplist as the default list of operators"
  ;; Return something useful, but not too verbose:
  ;; the number of operators
  (length (setf *ops* oplist)))

(load "test1.lisp")
(mapc #'convert-op *school-ops*)
