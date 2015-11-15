(define nil '())
(define (enumerate-interval i n)
  (if (> i n)
      nil
      (cons i (enumerate-interval (+ i 1) n))))
(define (prime? n)
  (define (iter i)
    (if (<= n i)
        #t
        (and (positive? (modulo n i)) (iter (+ i 1)))))
  (if (= n 1)
      #f
      (iter 2)))


;; n = 10
(display
 (foldr
  append nil (map (lambda (i)
                    (map (lambda (j) (list i j))
                         (enumerate-interval 1 (- i 1))))
                  (enumerate-interval 1 10))))
(newline)

(define (flatmap proc seq)
  (foldr append nil (map proc seq)))
(display (flatmap (lambda (i)
                    (map (lambda (j) (list i j))
                         (enumerate-interval 1 (- i 1))))
                  (enumerate-interval 1 10)))
(newline)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(display (map prime-sum? '((1 2) (1 3) (1 4))))
(newline)

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap (lambda (i)
                          (map (lambda (j) (list i j))
                               (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))
(display (prime-sum-pairs 15))
(newline)
(newline)

;;
(define (permutations s)
  (if (null? s)
      (list nil)                        ;'(())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
(display (permutations (list 1 2 3)))
(newline)

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))
