(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (add-interval x y)
(make-interval (+ (lower-bound x) (lower-bound y))
               (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))
                                 )))



(define foo (make-interval 10 20))
(define bar (make-interval 30 60))

(display "add:")
(display (add-interval foo bar))
(newline)
(display "mul:")
(display (mul-interval foo bar))
(newline)
(display "div:")
(display (div-interval foo bar))
(newline)
