(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things)) answer))))
  (iter items null))


(display (square-list (list 1 2 3 4)))
;; => (16 9 4 1)

;; 後に処理に回ったものが、最初に追加されていくので逆順に

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))))))
  (iter items null))

(display (square-list2 (list 1 2 3 4)))
;;  => ((((() . 1) . 4) . 9) . 16)

;; answerはlist. cdrにlistを連結していけば1listになるが、carがlist
;;   だと(cons (list 1 2) 3) => (list (list 1 2) 3)となる
