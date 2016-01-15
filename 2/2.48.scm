(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))


(define (make-segment vect-s vect-e)
  (cons vect-s vect-e))

(define (start-segment segment)
  (car segment))
(define (end-segment)
  (cdr segment))
