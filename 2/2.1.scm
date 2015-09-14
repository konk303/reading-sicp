;; 1. 負かどうかの判定は (< (0 x))
;; 1. 分数のマイナス対応は
;;   1. 2/3 -> 2/3
;;   1. -2/3 -> -2/3
;;   1. 2/-3 -> -2/3
;;   1. -2/-3 -> 2/3


(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x) (newline)(display (numer x)) (display "/") (display (denom x))(newline))


(define (make-rat n d)
  (let (
        (g (gcd n d))
        (mi (if (< 0 d) 1 -1))
        )
    (cons (/ (* mi n) g) (/ (* mi d) g)))
  )
