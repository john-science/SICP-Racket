#lang racket

; This is our Newton's Method
; re-written to make use of lexical scoping

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


; Just some print-outs to test the new toys

(display "(sqrt 4) = ")
(display (sqrt 4))

(display "\n(sqrt 100.001) = ")
(display (sqrt 100.001))

(display "\n")

