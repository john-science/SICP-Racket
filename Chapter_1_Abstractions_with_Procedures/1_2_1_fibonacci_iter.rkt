#lang racket
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
     b
     (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

(display "(fib 3)\n")
(display (fib 3))
(newline)(newline)
(display "(fib 13)\n")
(display (fib 13))
(newline)
