(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))


(define (weights branch)
  (cond ((pair? (branch-structure branch)) (weights (branch-structure branch)))

  )

(define (total-weight mobile)
  (+ (branch-structure left-branch) (branch-structure right-branch))
  )
