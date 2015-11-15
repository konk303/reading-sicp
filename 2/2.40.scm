(define nil '())
(define (enumerate-interval i n)
  (if (> i n)
      nil
      (cons i (enumerate-interval (+ i 1) n))))
(define (prime? n)
  (define (iter i)
    (cond ((<= n i) #t)
          ((zero? (modulo n i)) #f)
          (else (iter (+ i 1)))))
  (if (= n 1)
      #f
      (iter 2)))


(define (flatmap proc seq)
  (foldr append nil (map proc seq)))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (unique-pairs n)
  (flatmap (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))
(display (unique-pairs 10))
(newline)


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
(display (prime-sum-pairs 15))
(newline)
