(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items)) (map proc (cdr items)))))

(map (lambda (x) (* x x)) (list 1 2 3 4))


(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))
