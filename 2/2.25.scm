(define a '(1 3 (5 7) 9))
(display (car (cdr (car (cdr (cdr a))))))
(newline)

(define b '((7)))
(display (car (car b)))
(newline)

(define c '(1 (2 (3 (4 (5 (6 7)))))))
(display (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))))
(newline)
