(define nil '())
(define (enumerate-interval i n)
  (if (> i n)
      nil
      (cons i (enumerate-interval (+ i 1) n))))
(define (flatmap proc seq)
  (foldr append nil (map proc seq)))


(define (unique-trios n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list k j i))
                             (enumerate-interval 1 (- j 1))
                             ))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
(display (unique-trios 10))
(newline)

(define (total-matched-trios s n)
  (filter (lambda (x) (= s (foldr + 0 x)))
          (unique-trios n)))

(display (total-matched-trios 15 10))
(newline)
