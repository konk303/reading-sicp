(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;; 1
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car(cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;; 2
(define (total-weight mobile)
  (define (weights branch)
    (let (
          (structure (branch-structure branch)))
      (cond ((pair? structure)
             (+
              (weights (left-branch structure))
              (weights (right-branch structure))
              ))
            (else structure))))
  (+ (weights (left-branch mobile)) (weights (right-branch mobile))))

;; 3
(define (balanced? mobile)
  (define (torque branch)
    (let ((structure (branch-structure branch)))
      (if (pair? structure)
          (* (branch-length branch) (total-weight structure))
          (* (branch-length branch) structure))))
  (let ((left-structure (branch-structure (left-branch mobile)))
        (right-structure (branch-structure (right-branch mobile))))
    (and (if (pair? left-structure)
             (balanced? left-structure)
             #t)
         (if (pair? right-structure)
             (balanced? right-structure)
             #t)
         (= (torque (left-branch mobile)) (torque (right-branch mobile))))))


(define (balanced2? mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))
  (if (pair? mobile)
      (let ((l (left-branch mobile))
            (r (right-branch mobile)))
        (and (=
              (* (branch-length l) (branch-weight l))
              (* (branch-length r) (branch-weight r)))
             (balanced2? (branch-structure l))
             (balanced2? (branch-structure r))))
      #t))




(define a (make-mobile (make-branch 40 40)
                       (make-branch 20 (make-mobile (make-branch 30 50)
                                                    (make-branch 50 (make-mobile
                                                                     (make-branch 60 10)
                                                                     (make-branch 30 20)
                                                                     ))))))
(display a)
(newline)
(display (left-branch a))
(newline)
(display (right-branch a))
(newline)
(display (branch-length (left-branch a)))
(newline)
(display (branch-structure (right-branch a)))
(newline)
(display (total-weight a))
(newline)
(display (balanced? a))
(newline)
(display (balanced2? a))

;; 4
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))


(define (right-branch mobile)
  (cdr mobile))
(define (branch-structure branch)
  (cdr branch))

(define a4 (make-mobile (make-branch 40 40)
                       (make-branch 20 (make-mobile (make-branch 30 50)
                                                    (make-branch 50 (make-mobile
                                                                     (make-branch 60 10)
                                                                     (make-branch 30 20)
                                                                     ))))))
(display a4)
(newline)
(display (left-branch a4))
(newline)
(display (right-branch a4))
(newline)
(display (branch-length (left-branch a4)))
(newline)
(display (branch-structure (right-branch a4)))
(newline)
(display (total-weight a4))
(newline)
(display (balanced? a4))
(newline)
