(define nil '())

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(display (fold-right / 1 (list 1 2 3)))
;; (((3 / 1) / 2) / 1) = 3/2
(newline)

(display (fold-left  / 1 (list 1 2 3)))
;; (((1 / 1) / 2) / 3) = 1/6
(newline)

(display (fold-right list nil (list 1 2 3)))
;; (1 (2 (3 nil)))
(newline)

(display (fold-right cons nil (list 1 2 3)))
;; (1 2 3)
(newline)

(display (fold-left  list nil (list 1 2 3)))
;; (((nil 1) 2) 3)
(newline)

(display (fold-left cons nil (list 1 2 3)))
;; (((nil . 1) . 2) . 3)
(newline)

;; +, * 等、実行順に依存しないprocは、foldl/foldrの結果が同じ
