#lang racket

; This is a super simple Newton's Method approach to calculating
; the square root of a number.
; We can improve upon this.

; super-simple average
(define (average x y)
  (/ (+ x y) 2))

; improve your guess, by taking that average of X and X/guess
(define (improve guess x)
  (average guess (/ x guess)))

; Is the value close enough that we can stop?
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; The iterative Newton's Method to find a square-root
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

; HERE is the master square-root function
(define (sqrt x)
  (sqrt-iter 1.0 x))


; TODO: print some results
