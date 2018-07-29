#lang racket


;; Let's define a binary tree using lists in this way:
(define (make-tree entry left right)
  (list entry left right)
)


;; And we can access the underlying info this way:
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))


;; test to see if an element is in the tree
(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((= x (entry set)) true)
    ((< x (entry set))
      (element-of-set? x (left-branch set))
    )
    ((> x (entry set))
      (element-of-set? x (right-branch set))
    )
  )
)


