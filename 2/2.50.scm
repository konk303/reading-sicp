(require sicp-pict)
(define (flip-horiz painter)
  ((transform-painter (make-vect 1.0 0.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0))
   painter))

(define (rotate180 painter)
  (flip-vert (flip-horiz painter)))

(define (rotate270 painter)
  ((transform-painter (make-vect 0.0 1.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0))
   painter))


(paint einstein)
(paint (flip-horiz einstein))
(paint (rotate180 einstein))
(paint (rotate270 einstein))
