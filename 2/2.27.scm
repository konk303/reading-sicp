(define (reverse items)
  (define (reverse-iter a result)
    (if (null? a)
        result
        (reverse-iter (cdr a) (cons (car a) result))))
  (reverse-iter items null))

(define (deep-reverse items)
  (define (iter a result)
    (cond ((null? a) result)
          ((list? (car a)) (iter (cdr a) (cons (deep-reverse (car a)) result)))
          (else (iter (cdr a) (cons (car a) result)))))
  (iter items null))



(define x (list (list 1 2) (list 3 4)))
(display x)
;; ((1 2) (3 4))
(newline)

(display (reverse x))
;; ((3 4) (1 2))
(newline)

(display (deep-reverse x))
;; ((4 3) (2 1))
(newline)
