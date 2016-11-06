(defun fibo(n)
    (setf x 0)
    (setf y 1)
    (setf z 1)
    (if (> n 1)
        (format t "~d " z)
    )
    (loop
      (setq z (+ x y))
      (setq x y)
      (setq y z)
      (when (> z n) (return 1))
      (format t "~d " z)
    )
)