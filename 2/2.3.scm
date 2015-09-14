(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)(cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (perimeter rectangle)
  (+ (* (width rectangle) 2) (* (height rectangle) 2))
  )
(define (area rectangle)
  (* (width rectangle) (height rectangle))
  )

;; with width/height
(define (make-rectangle w h) (cons w h))
(define (width rectangle) (car rectangle))
(define (height rectangle) (cdr rectangle))


;; with point start/ end
(define (make-rectangle2 start end)(cons start end))

;; TODO: how can I use same widht/height procs?
(define (width rectangle2)
  (let (
        (start (car rectangle2 ))
        (end (cdr rectangle2))
        )
    (- (x-point end) (x-point start))
    ))
(define (height rectangle2)
  (let (
        (start (car rectangle2 ))
        (end (cdr rectangle2))
        )
    (- (y-point end) (y-point start))
    ))
