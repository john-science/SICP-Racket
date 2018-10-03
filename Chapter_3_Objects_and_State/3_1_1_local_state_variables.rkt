#lang racket


;; example dispatcher to create a stateful program
;;   In this case, a toy bank account.
(define (make-account balance)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount))
				   balance)
			"Insufficient funds"
		)
	)
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance
	)
	(define (dispatch m)
		(cond ((eq? m `withdraw) withdraw)
			  ((eq? m `deposit) deposit)
			  (else (error "Unknown request -- MAKE-ACCOUNT" m))
		)
	)
dispatch
)


;; init an example bank account for bob
(newline)
(display "##########################")
(newline)
(display "#  Let's give Bob $100.  #")
(newline)
(display "##########################")
(newline)
(define bobs_account (make-account 100))

(newline)
(display "Bob withdraws $50: ")
((bobs_account `withdraw) 50)

(newline)
(display "Bob tries to withdraw $90: ")
((bobs_account `withdraw) 90)

(newline)
(display "Bob deposits $125.50: ")
((bobs_account `deposit) 125.50)

(newline)
(display "Bob withdraws $40: ")
((bobs_account `withdraw) 40)
(newline)
