(require sicp-pict)

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
           ((transform-painter (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point)
            painter1))
          (paint-up
           ((transform-painter split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))
            painter2)))
      (lambda (frame) (paint-below frame) (paint-up frame)))))

(define (below2 painter1 painter2)
  (let ((besided
         (beside (rotate270 painter1)
                 (rotate270 painter2))))
    (lambda (frame) ((rotate90 besided) frame))))
