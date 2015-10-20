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

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))
                                 )))
(define (add-interval x y)
(make-interval (+ (lower-bound x) (lower-bound y))
               (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (make-center-percent c p)
  (make-center-width c (* c p)))
(define (percent i)
  (/ (width i) (center i)))


(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))






(define foo (make-interval 9 11))
(define bar (make-interval 19 22))

(display (make-center-percent 10 0.1))  ;foo
(display (make-center-percent 20 0.05)) ;bar

(display "par1:")
(display (par1 foo bar))
(newline)
(display "par2:")
(display (par2 foo bar))



;; (display "center:")
;; (display (center foo))
;; (newline)
;; (display "width:")
;; (display (width foo))
;; (newline)
;; (display "percent:")
;; (display (percent foo))
;; (newline)
;; (display "make-center-width:")
;; (display (make-center-width 15 5))
;; (newline)
;; (display "make-center-percent:")
;; (display (make-center-percent 15 0.5))
;; (newline)
