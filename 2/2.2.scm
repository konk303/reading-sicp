(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y)(cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (midpoint-segment segment)
  (let (
        (start (start-segment segment))
        (end (end-segment segment))
        )
    (print-point (make-point
                  (/ (+ (x-point start) (x-point end)) 2)
                  (/ (+ (y-point start) (y-point end)) 2)
     ))
    )
  )
