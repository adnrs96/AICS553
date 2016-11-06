(defun linear_srch (A key)

  (loop for i from 0 to (- (car (array-dimensions A)) 1)
      do(
        progn
          (if (= (aref A i) key)
            (progn
            (format t "Found in Matrix at Position: ~D" (+ i 1))
            (terpri)
            (return-from linear_srch 1)
          ))
      )
   )
   (format t "NOT FOUND IN MATRIX")
   (return-from linear_srch 0)
)

(format t "Enter N for to be searched Matrix")
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
 (linear_srch A key)
