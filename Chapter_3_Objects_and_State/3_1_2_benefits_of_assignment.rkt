#lang racket

;; master function to estimate Pi
(define (estimate-pi trials)
	(sqrt (/ 6 (monte-carlo trials cesaro-test))))

;; determine if two random numbers have any >1 common denominators
(define (cesaro-test)
	(= (gcd (random 100) (random 100)) 1))

;; simple Monte-Carlo Method
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
	(cond ((= trials-remaining 0)
		   (/ trials-passed trials))
	      ((experiment)
	      	(iter (- trials-remaining 1) (+ trials-passed 1)))
	      (else
	      	(iter (- trials-remaining 1) trials-passed))))
	(iter trials 0))


(newline)
(display "Let's very slowly calculate Pi:")
(newline)
(display (estimate-pi 5))
(newline)
(display (estimate-pi 10))
(newline)
(display (estimate-pi 20))
(newline)
(display (estimate-pi 40))
(newline)
(display (estimate-pi 80))
(newline)
(display (estimate-pi 160))
(newline)
(display (estimate-pi 320))
(newline)
(display (estimate-pi 640))
(newline)
(display (estimate-pi 1280))
(newline)
(display (estimate-pi 2560))
(newline)
(display (estimate-pi 5120))
(newline)
(display (estimate-pi 64000))
(newline)
(display (estimate-pi 128000))
(newline)
(newline)
