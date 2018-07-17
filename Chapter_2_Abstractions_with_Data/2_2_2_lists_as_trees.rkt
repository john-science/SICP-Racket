#lang racket

; count the number of leaves in the tree/list
; original, tail-recursive version from the book
(define (count-leaves x)
  (cond
    ((null? x) 0)
    ((not (pair? x)) 1)
    (else (+ (count-leaves (car x))
             (count-leaves (cdr x))
          )
    )
  )
)


(display "\n(count-leaves (list 1 2 3 4)):  ")
(display (count-leaves (list 1 2 3 4)))

(display "\n(count-leaves (list (list 1 2) 3 4)):  ")
(display (count-leaves (list (list 1 2) 3 4)))

(display "\n(count-leaves (list (list 1 2) (list 3 4))):  ")
(display (count-leaves (list (list 1 2) (list 3 4))))
(newline)



; EXERCISE 2.27
; reverse a list, and any sub-list inside
; in effect, do a deep-search version of a list reverse
(define (deep-reverse list1)
  (define (reverse_iter list1 list2)
    (cond ((null? list1) list2)
          ((not (pair? list1)) list1)
          (else (reverse_iter (cdr list1) (cons (deep-reverse (car list1)) list2)))
    )
  )
  (reverse_iter list1 '())
)


(display "\n(deep-reverse (list 1 2 3)):  ")
(display (deep-reverse (list 1 2 3)))

(display "\n(deep-reverse (list (list 1 2) 3)):  ")
(display (deep-reverse (list (list 1 2) 3)))

(display "\n(deep-reverse (list (list 1 2) 3 (list 6 7 8 9 10))):  ")
(display (deep-reverse (list (list 1 2) 3 (list 6 7 8 9 10))))
(newline)


; EXERCISE 2.28
; flatten a tree into an ordered list of the leaves (left-to-right)
(define (fringe x)
  (cond
    ((null? x) '())
    ((not (pair? x)) (list x))
    (else (append (fringe (car x))
                  (fringe (cdr x))
          )
    )
  )
)


(display "\n(fringe (list (list 1 2) 3 4)):  ")
(display (fringe (list (list 1 2) 3 4)))

(display "\n(fringe (list (list 1 2) (list (list 3 5 6 7)) 8)):  ")
(display (fringe (list (list 1 2) (list (list 3 5 6 7)) 8)))

(display "\n(fringe (list (list (list 1 2) (list (list 3 5 6 7))))):  ")
(display (fringe (list (list (list 1 2) (list (list 3 5 6 7))))))
(newline)
(newline)
