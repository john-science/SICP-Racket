#lang racket


(define (estimate-pi trails)
	(sqrt (/ 6 (monte-carlo trials cesaro-test))))


(define (cesaro-test)
	(= (gcd (rand) (rand)) 1))

