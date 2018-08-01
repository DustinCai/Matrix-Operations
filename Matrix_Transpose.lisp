(defun matrix-transpose(matrix)
    (setq lst '())
    (transpose matrix lst)
)

(defun transpose(matrix lst)
    (setq sublst '())
    (if (eql (car (car matrix)) nil)
        lst
        (progn
            (setq sublst (mapcar #'car matrix))
            (setq matrix (mapcar #'cdr matrix))
            (setq lst (append lst (list sublst)))
            (transpose matrix lst)
        )
    )
)
