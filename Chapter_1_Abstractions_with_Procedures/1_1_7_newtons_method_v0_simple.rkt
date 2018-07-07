#lang racket

; This is the simplest form of our Newton's Method

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt x)
   (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (improve guess x)
  (average guess (/ x guess)))

; Just some print-outs to test the new toys

(display "(sqrt 4) = ")
(display (sqrt 4))

(display "\n(sqrt 100.001) = ")
(display (sqrt 100.001))

(display "\n")

