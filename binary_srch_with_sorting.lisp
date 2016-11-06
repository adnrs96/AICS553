(defun sort_array(A n)


(loop for i from 0 to (- (car (array-dimensions A)) 1)
    do(
        loop for j from i to (- (car (reverse(array-dimensions A))) 1 )
        do
        (
        progn
          (if (> (aref A i) (aref A j))
            (
            progn
            (setf temp (aref A i))
            (setf (aref A i) (aref A j))
            (setf (aref A j) temp)
            )
          )
        )
    )
 )

  (return-from sort_array A)
)

(defun chk_sorted (A n)

(loop for i from 1 to (- n 1)
    do(progn
        (if (> (aref A (- i 1)) (aref A i) )
            (
              progn
              (format t "Ohk Array was not sorted")
              (terpri)
              (format t "Sorting Array now...")
              (terpri)
              (return-from chk_sorted(sort_array A n))
            )
          )
    )
 )
 (format t "Ohk Array was sorted")
 (terpri)
 (return-from chk_sorted A)

)


(defun binary_srch (A i j key)

(setq mid (floor (/ (+ i j) 2)))
(if (<= i j)
(cond
  (
    (= (aref A mid) key)
    (
    progn
      (setf temp (- mid 1))
      (setf indexes (list mid))
      (loop while (= (aref A temp) key)
          do(
              progn
              (setf indexes (cons temp indexes))
              (setf temp (- temp 1))
          )
      )
      (setf temp (+ mid 1))
      (setf indexes (reverse(indexes)))
      (loop while (= (aref A temp) key)
          do(
            progn
              (setf indexes (cons temp indexes))
              (setf temp (+ temp 1))
          )
      )
      (setf indexes (reverse indexes)))
      (format t "Found At indexes ~D" indexes)
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
(setf A (chk_sorted A n1))
 (binary_srch A 0 (- n1 1) key)
