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
    (cons (list col row) roq))
  (define (safe? k positions)
    (let ((current-r (cadar positions)))
      (define (iter l)
        (if (null? l)
            #t
            (let ((c (caar l))
                  (r (cadar l)))
              (cond ((= r current-r) #f)
                    ((= r (- current-r (- k c))) #f)
                    ((= r (+ current-r (- k c))) #f)
                    (else (iter (cdr l)))))))
      (iter (cdr positions))))
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
