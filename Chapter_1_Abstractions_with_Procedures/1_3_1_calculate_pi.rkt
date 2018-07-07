#lang racket


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Let's Calculate Pi!
;;;;;;;;;;;;;;;;;;;;;;;;;;;


; This is your standard Sigma operator, summing from 0 to N
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
      (sum term (next a) next b))))

; Now let's do the actual Pi summation
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4.))
  (sum pi-term a pi-next b))


; You also have to multiply by 8
(define (calc-pi n)
  (* 8. (pi-sum 1 n)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Let's Calculate Pi!
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display (calc-pi 100))
(newline)

(display (calc-pi 1000))
(newline)

(display (calc-pi 10000))
(newline)

(display (calc-pi 100000))
(newline)
