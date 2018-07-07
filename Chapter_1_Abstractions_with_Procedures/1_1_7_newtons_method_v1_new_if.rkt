#lang racket

; This is an attempt at Newton's Method
; using our own, homebrew "if" function
;
; Oh noes! This test (suggested in the book)
; causes an infinite loop!

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt x)
   (sqrt-iter 1.0 x))

(define (new-if pred then-clause else-clause)
  (cond (pred then-clause)
	(else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
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

