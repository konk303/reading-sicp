(define (fringe x)
  (cond ((null? x) (list))
        ((not (pair? x)) (list x))
        (else
         (append (fringe (car x))
                 (fringe (cdr x))))))


(define (fringe2 x)
  (define (iter a result)
    (if (null? a)
        result
        (if (pair? a)
            (iter (car a) (iter (cdr a) result))
            (cons a result))))
  (iter x null))


(define x (list (list 1 2) (list 3 4)))
(display (fringe x))
;; (1 2 3 4)
(newline)

(display (fringe (list x x)))
;; (1 2 3 4 1 2 3 4)


(display (fringe2 x))
;; (1 2 3 4)
(newline)

(display (fringe2 (list x x)))
;; (1 2 3 4 1 2 3 4)
