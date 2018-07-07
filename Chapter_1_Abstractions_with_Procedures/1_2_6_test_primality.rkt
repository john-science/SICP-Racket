#lang racket


; Find the smallest divisor of an integer
;     If this returns n, then n is prime
(define (smallest-divisor n)
  (find-divisor n 2))

; Find the next largest divisor of n
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

; modulo
(define (divides? a b)
  (= (remainder b a) 0))


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Test if N is prime
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (prime? n)
  (= n (smallest-divisor n)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Print some examples
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (print-is-prime n)
	(display "Is ")
	(display n)
	(display " prime? ")
	(display (prime? n))
	(newline))


(print-is-prime 3)
(print-is-prime 13)
(print-is-prime 23)
(print-is-prime 24)
(print-is-prime 333)
