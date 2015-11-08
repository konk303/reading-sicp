(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ (* higher-terms x) this-coeff))
   0
   coefficient-sequence))

;; anxn +an−1xn−1 +···+a1x+a0
;; x=2
;; (horner-eval 2 (list 11 12 13 14 15 16))
;; 16x5 + 15x4 + 14x3 + 13x2 + 12x1 + 11x0
;; ((((16x + 15)x + 14)x + 13)x + 12)x + 11
(horner-eval 2 (list 1 3 0 5 0 1))
;; 1x5 + 0x4 + 5x3 + 0x2 + 3x1 + 1x0
;; 32 + 0 + 40 + 0 + 6 + 1 = 79
;; ((((1x + 0)x + 5)x + 0)x + 3)x + 1
