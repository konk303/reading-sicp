(define (reverse items)
  (define (reverse-iter a result)
    (if (null? a)
        result
        (reverse-iter (cdr a) (cons (car a) result))))
  (reverse-iter items null))
(reverse (list 1 2 3 4))

;; (define (reverse items)
;;   (if (null? items)
;;       null
;;       (cons (reverse (cdr items)(car items)))))
