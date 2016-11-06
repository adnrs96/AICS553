(defun mulNxN (A B)
  (if
    (mismatch (list (car (reverse(array-dimensions A))))(list (car (array-dimensions B))))
    (progn
      (format t "Matrix Non Compatible")
      (return-from mulNxN 0)
    )
  )
  (setq C (make-array (list (car (array-dimensions A)) (car (reverse(array-dimensions B))))))
  (loop for i from 0 to (- (car (array-dimensions A)) 1)
      do(
          loop for j from 0 to (- (car (reverse(array-dimensions B))) 1 )
          do
          ( progn
              (setf tmp 0)
              (loop for k from 0 to (- (car (reverse(array-dimensions A))) 1 )
              do
              (setf tmp (+ tmp (* (aref A i k) (aref B k j))))
          ))
          (setf (aref C i j) tmp)
      )
   )
   (return-from mulNxN C)
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
(format t "Enter M for First Matrix")
(setf m1 (read))
(format t "Enter N for Second Matrix")
(setf n2 (read))
(format t "Enter M for Second Matrix")
(setf m2 (read))
(setf A (make-array (list n1 m1)))
  (dotimes (i n1)
    (
      dotimes (j m1)
        (format t "Enter ~D ~D th Element of First Matrix" i j)
        (terpri)
        (setf (aref A i j) (read))
    )
 )
 (setf B (make-array (list n2 m2)))
   (dotimes (i n2)
     (
       dotimes (j m2)
         (format t "Enter ~D ~D th Element of Second Matrix" i j)
         (terpri)
         (setf (aref B i j) (read))
     )
  )
  (printmatrix (mulNxN A B))
