(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect
      (scale-vect (xcor-vect v)
                  (edge1-frame frame))
      (scale-vect (ycor-vect v)
                  (edge2-frame frame))))))

;; ((frame-coord-map a-frame) (make-vect 0 0))
;; ;; ==
;; (origin-frame a-frame)


;; 2.46

(define (make-vect x y)
  (cons x y))
(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cdr vect))
(define (add-vect v1 v2)
  (cons (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))
(define (sub-vect v1 v2)
  (cons (- (xcor-vect v1) (xcor-vect v2))
        (- (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect s vect)
  (cons (* s (xcor-vect vect))
        (* s (ycor-vect vect))))
;; (x1,y1) + (x2,y2) = (x1 + x2,y1 + y2),
;; (x1,y1) − (x2,y2) = (x1 − x2,y1 − y2),
;; s · (x,y) = (sx,sy).
