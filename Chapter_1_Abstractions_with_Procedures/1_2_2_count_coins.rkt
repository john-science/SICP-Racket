#lang racket


(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))


(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


; Just a helper function to make printing multiple trials easier
(define (pprint-count n)
  (display n)
  (display " cents: ")
  (display (count-change n))
  (display " ways\n"))


(display "Counting the number of ways to make change with US coins:\n")
(pprint-count 10)
(pprint-count 100)
(pprint-count 237)
