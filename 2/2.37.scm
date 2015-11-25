(define nil null)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define v1 '(1 2 3 4))
(define v2 '(4 5 6 6))
(define v3 '(6 7 8 9))
(define matrix (list v1 v2 v3))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(display (dot-product v1 v2))
(newline)
(display (+ 4 10 18 24))
(newline)

(define (matrix-*-vector m v)
  (map (lambda(x) (dot-product x v))
       m))

(display (matrix-*-vector matrix v1))
(newline)
(display (list (+ 1 4 9 16) 56 (+ 6 14 24 36)))
(newline)

(define (transpose mat)
  (accumulate-n cons nil mat))

(display (transpose matrix))
(newline)
(display (list '(1 4 6) '(2 5 7) '(3 6 8) '(4 6 9)))
(newline)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map
     (lambda (x) (matrix-*-vector cols x))
     m)))

(display (matrix-*-matrix matrix (transpose matrix)))
(newline)
