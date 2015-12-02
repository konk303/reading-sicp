;; 2.42では (k-i)で矛盾なく置けたパターンごとに8行の各パターンを試すのに対し、
;; 2.43は、8行のパターンに対しそれぞれ(k-1)の矛盾がないパターンを計算してる
;; 2.42がT とすると 2.43は T * k * k (?)

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
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size))
         )))
  (queen-cols board-size))
