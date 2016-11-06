(defun addNxN (A B)
  (if
    (mismatch (array-dimensions A)(array-dimensions B))
    (progn
      (format t "Matrix Non Compatible")
      (return-from addNxN 0)
    )
  )
  (setq C (make-array (array-dimensions A)))
  (loop for i from 0 to (- (car (array-dimensions A)) 1)
      do(
          loop for j from 0 to (- (car (reverse(array-dimensions A))) 1 )
          do
          (setf (aref C i j) (+ (aref A i j) (aref B i j)))
      )
   )
   (return-from addNxN C)
)

(defun printmatrix (A)

  (format t "The Resultant Matrix is ")
  (terpri)
  (loop for i from 0 to (- (car (array-dimensions A)) 1)
    do(
        loop for j from 0 to (- (car (reverse(array-dimensions A))) 1 )
        do
        (format t "~D " (aref A i j))
    )
    (terpri)
    )

)
(format t "Enter N for First Matrix")
(setf n1 (read))
(format t "Enter N for Second Matrix")
(setf n2 (read))
(setf A (make-array (list n1 n1)))
  (dotimes (i n1)
    (
      dotimes (j n1)
        (format t "Enter ~D ~D th Element of First Matrix" i j)
        (terpri)
        (setf (aref A i j) (read))
    )
 )
 (setf B (make-array (list n2 n2)))
   (dotimes (i n2)
     (
       dotimes (j n2)
         (format t "Enter ~D ~D th Element of Second Matrix" i j)
         (terpri)
         (setf (aref B i j) (read))
     )
  )
  (printmatrix (addNxN A B))
