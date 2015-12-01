(define nil '())
(define (enumerate-interval i n)
  (if (> i n)
      nil
      (cons i (enumerate-interval (+ i 1) n))))
(define (flatmap proc seq)
  (foldr append nil (map proc seq)))


(define (safe? k positions)
  (let ((current (car positions))
        (prevs (cdr positions)))
    (let ((current-c (car current))
          (current-r (cadr current))
          (prevs-c (map (lambda (l) (car l)) prevs))
          (prevs-r (map (lambda (l) (cadr l)) prevs)))
      (and
       (foldr (lambda (i j) (and i j)) #t (map (lambda (x) (not (= x current-c))) prevs-c))
       (foldr (lambda (i j) (and i j)) #t (map (lambda (x) (not (= x current-r))) prevs-r))
       ;; todo 斜め
       ))))
(define (queens board-size)
  (define empty-board nil)
  ;; (define (adjoin-position row col roq)
  ;;   (cons (list col row) roq))
  (define (adjoin-position row col roq)
    (cons (list col row) roq))
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
