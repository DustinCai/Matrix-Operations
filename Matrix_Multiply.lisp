(defun matrix-multiply(left right)
    (setq matrix '())
    (setq right (matrix-transpose right))
    (multiply-helper left right matrix)
)
(defun multiply-helper(left right matrix) ;for first matrix, we want to cdr down
    (setq sublst '())
    (setq row '())

    (if (eql left nil)
        matrix
        (progn
            (setq matrix (setq matrix (append matrix (list (get-row left right sublst row)))))
            (multiply-helper (cdr left) right matrix)
        )
    )
)
(defun get-row(left right sublst row) ;for second matrix, we want to cdr down
    (if (eql right nil)
        row
        (progn
            (setq sublst (mapcar #'* (car left) (car right)) )
            (setq sublst (apply '+ sublst))
            (setq row (append row (list sublst)))
            (get-row left (cdr right) sublst row)
        )
    )
)
