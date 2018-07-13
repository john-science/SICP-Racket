#lang racket

; Let's just implement some basic list funcionality the language
; already has, for learning purposes

(define (length_ seq)
  (if (null? seq)
      0
      (+ 1 (length_ (cdr seq)))
  )
)

(define (append_ list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append_ (cdr list1) list2))
    )
)

(define (reverse_ list1)
  (define (reverse_iter list1 list2)
    (if (null? list1)
        list2
        (reverse_iter (cdr list1) (cons (car list1) list2))
    )
  )
  (reverse_iter list1 '())
)


; Just some examples

(define 1to4 (list 1 2 3 4))

(display "\nlength of 1-4: ")
(display (length_ 1to4))


(display "\nappend 5-8 to 1-4: ")
(display (append_ 1to4 (list 5 6 7 8)))


(display "\nreverse of 1-4: ")
(display (reverse_ 1to4))
(newline)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Okay, no let's have some fun with the built-in "map"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(display "\n\n(map + (list 1 2 3) (list 5 6 7))\n")
(display (map + (list 1 2 3) (list 5 6 7)))

(newline)
(display "\n(map (lambda (x) (* 2 x)) (list 1 2 3))\n")
(display (map (lambda (x) (* 2 x)) (list 1 2 3)))

(newline)
(display "\n(map (lambda (x) (* x x x)) (range 1 10))\n")
(display (map (lambda (x) (* x x x)) (range 1 10)))

(newline)
(display "\n(map (lambda (a b) (+ (* a a) (* 2 b))) (range 1 10) (range 11 20))\n")
(display (map (lambda (a b) (+ (* a a) (* 2 b))) (range 1 10) (range 11 20)))

(define (square-list lst)
  (map (lambda (e) (* e e)) lst)
)

(display "\n\n(square-list (range 7 13))\n")
(display (square-list (range 7 13)))
(newline)

(display "\nfor-each loops over a sequence, but does not return a formed list like map:")
(for-each (lambda (x) (newline) (display "\t") (display x))
	(range 55 59))

(newline)
(newline)
