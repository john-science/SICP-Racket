#lang racket

; count the number of leaves in the tree/list
; original, tail-recursive version from the book
(define (count-leaves0 x)
  (cond
    ((null? x) 0)
    ((not (pair x)) 1)
    (else (+ (count-leaves0 (car x))
             (count-leaves0 (cdr x))
          )
    )
  )
)

; count the number of leaves in the tree/list
; modified from the book to NOT be tail-recursive
(define (count-leaves tree)
  (define (count_leaves-iter x n)
    (cond
      ((null? x) 0)
      ((not (pair x)) 1)
       (else (count-leaves-iter (car x) n)
             (count-leaves-iter (cdr x) n)
      )
    )
  )
  (count-leaves tree 0)
)
