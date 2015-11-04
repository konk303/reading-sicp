(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car(cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (weights branch)
    (cond ((pair? (branch-structure branch))
           (+
            (weights (left-branch (branch-structure branch)))
            (weights (right-branch (branch-structure branch)))
            ))

          (else (branch-structure branch))))
  (+ (weights (left-branch mobile)) (weights (right-branch mobile))))
