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

(define (matrix-*-vector m v)
  (map (lambda(x) (dot-product x v))
       m))

(display (matrix-*-vector matrix v1))
(newline)

(define (transpose mat)
  (accumulate-n cons nil mat))

(display (transpose matrix))
(newline)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map
     (lambda (x) (matrix-*-vector n x))
     m)))

(display (matrix-*-matrix matrix matrix))
