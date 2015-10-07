(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))



(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c p)))
(define (percent i)
  (/ (width i) (center i)))

(define foo (make-interval 10 20))

(display "center:")
(display (center foo))
(newline)
(display "width:")
(display (width foo))
(newline)
(display "percent:")
(display (percent foo))
(newline)
(display "make-center-width:")
(display (make-center-width 15 5))
(newline)
(display "make-center-percent:")
(display (make-center-percent 15 0.5))
(newline)
