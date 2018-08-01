#Matrix Add
(defun matrix-add(firstlst secondlst)
    (setq matrix '())
    (add firstlst secondlst matrix)
)
(defun add(left right matrix)
    (setq sublst '())
    (if (eql left nil)
        matrix
        (progn
          (setq sublst (mapcar #'+ (car left) (car right))) ;add elem in beginning of each lst
          (setq matrix (append matrix (list sublst)))       ;move on the next elem
          (add (cdr left) (cdr right) matrix)
        )
    )
)
