(define (square x) (* x x))

(define (tree-map fn items)
  (map (lambda (item)
         (if (pair? item)
             (tree-map fn item)
             (fn item)))
       items))


(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))
