(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (pair? x)
                         (count-leaves x)
                         1
                         ))
                   t)))

(define (count-leaves2 t)
  (define (enumerate-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (list tree))
          (else (append (enumerate-tree (car tree))
                        (enumerate-tree (cdr tree))))))
  (accumulate (lambda (x y) (+ y 1))
              0
              (enumerate-tree t)))
