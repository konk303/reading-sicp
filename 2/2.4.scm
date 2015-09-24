(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define (test) (cons 3 5))
(display (car (test)))
(display ",")
(display (cdr (test)))
