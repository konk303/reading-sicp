(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map ⟨??⟩ rest)))))

(subesets (1 2 3))
;; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
