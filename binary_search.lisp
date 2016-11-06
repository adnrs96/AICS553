(defun binary_srch (A i j key)

(setq mid (floor (/ (+ i j) 2)))
(if (<= i j)
(cond
  (
    (= (aref A mid) key)
    (format t "Found At index ~D" (+ mid 1))
  )
  (
    (< (aref A mid) key)
    (binary_srch A (+ mid 1) j key)
  )
  (
    (> (aref A mid) key)
    (binary_srch A i (- mid 1) key)
  )
)
(format t "NOT FOUND IN MATRIX")
)
)

(format t "Enter N for to be Matrix to be searched")
(terpri)
(setf n1 (read))
(setf A (make-array n1))
  (dotimes (i n1)
    (
      progn
        (format t "Enter ~D th Element of Matrix" (+ i 1))
        (terpri)
        (setf (aref A i) (read))
    )
 )
 (format t "Enter Number to be searched in matrix")
 (terpri)
 (setf key (read))
 (binary_srch A 0 (- n1 1) key)
