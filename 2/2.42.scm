(define nil '())
(define (enumerate-interval i n)
  (if (> i n)
      nil
      (cons i (enumerate-interval (+ i 1) n))))
(define (flatmap proc seq)
  (foldr append nil (map proc seq)))


(define (queens board-size)
  (define empty-board nil)
  (define (adjoin-position row col roq)
    (cons row roq))
  (define (safe? current-c positions)
    (let ((current-r (car positions)))
      (define (iter l c-distance)
        (if (null? l)
            #t
            (let ((r (car l)))
              (cond ((= r current-r) #f)
                    ((= r (- current-r c-distance)) #f)
                    ((= r (+ current-r c-distance)) #f)
                    (else (iter (cdr l) (+ c-distance 1)))))))
      (iter (cdr positions) 1)))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size))) ;行
          (queen-cols (- k 1))))))
  (queen-cols board-size))
