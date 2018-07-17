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
