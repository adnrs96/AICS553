(defun fact (x)
(if (<= x 0)
(return-from fact 1)
(* (fact (- x 1)) x)
))
(write "Enter The Number to calculate factorial for")
(setf x (read))
(format t "Factorial of Number ~2d :  ~2d ~%" x (fact x))


;Fact using iterative construct

(defun fact-iter (x) (setq f 1) (dotimes (i x)(setq f (* f (+ i 1)))) f)
