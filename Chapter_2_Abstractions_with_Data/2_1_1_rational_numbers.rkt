#lang racket


; builds a rational fraction from two integers
; TODO: reduce this ratio using GCDs
(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
  )
)

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))
  )
)

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))
  )
)

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))
  )
)

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   TODO: Do some examples
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define one-third (make-rat 1 3))
(define one-fourth (make-rat 1 4))

(display "1/3 + 1/4 = ")
(print-rat (add-rat one-third one-fourth))

(display "1/3 * 1/4 = ")
(print-rat (mul-rat one-third one-fourth))


