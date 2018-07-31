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


;; add an element to a set
(define (adjoin-set x set)
  (cond
    ((null? set) (make-tree x '() '()))
    ((= x (entry set)) set)
    ((< x (entry set))
      (make-tree (entry set)
                 (adjoin-set x (left-branch set))
                 (right-branch set)
      )
    )
    ((> x (entry set))
      (make-tree (entry set)
                 (left-branch set)
                 (adjoin-set x (right-branch set))
      )
    )
  )
)



;; Okay, well, let's play with our new tools some
(define (a) (make-tree 7 '(4) '(13)))
(define (b) (make-tree 70 '(54) '(313)))
(define (c) (make-tree 23 (a) (b)))

(display "a: ")
(display (a))
(newline)
(display "b: ")
(display (b))
(newline)
(display "c: ")
(display (c))
(newline)
(newline)

(define x (adjoin-set 10 '()))
(define y (adjoin-set 7 x))
(define z (adjoin-set 17 y))

(display "x: ")
(display x)
(newline)
(display "y: ")
(display y)
(newline)
(display "z: ")
(display z)
(newline)
