#lang racket

;; "The evaluator, which determines the meaning of expressions in a programming language, is just another program."


;; "EVALUATE" and expression, inside an environment
;;    This should probably not be a conditional, but lookup from a map table
(define (eval exp env)
	(cond ((self-evaluating? exp) env)
          ((variable? exp) (lookup-variable-value exp env))
          ((quoted? exp) (text-of-quotation exp))
          ((assignment? exp) (eval-assignment exp env))
          ((definition? exp) (eval-definition exp env))
          ((if? exp) (eval-if exp env))
          ((lambda? exp)
          	(make-procedure (lambda-parameters exp)
          		            (lambda-body exp)
          		            env))
          ((begin? exp) (eval-sequence (begin-actions exp) env))
          ((cond? exp) (eval (cond->if exp) env))
          ((application? exp) (apply (eval (operator exp) env)
          	                         (list-of-values (operands exp) env)))
          ((else) (error "Unknown expression type -- EVAL" exp))))


;; "APPLY" a procedure to a list of arguments
(define (apply procedure arguments)
	(cond ((primitive-procedure? procedure)
		   (apply-primitive-procedure procedure arguments))
	      ((compound-procedure? procedure)
	      	(eval-sequence
	      		(procedure-body procedure)
	      		(extend-environment
	      			(procedure-parameters procedure)
	      			arguments
	      			(procedure-environment procedure))))
	      (else
	      	(error "Unknown procedure type -- APPLY" procedure))))


;; process the arguments for a procedure
(define (list-of-values exps env)
	(if (no-operands? exps)
		'()
		(cons (eval (first-operand exps) env)
			  (list-of-values (rest-operands exps) env))))


;; handle the predicate part of an "if" expression
(define (eval-if exp env)
	(if (true? (eval (if-predicate exp) env))
		(eval (if-consequent exp) env)
		(eval (if-alternate exp) env)))


;; used by "APPLY" to evaluate a sequence of expressions in a procedure body
(define (eval-sequence exps env)
	(cond ((last-exp? exps) (eval (first-exp exps) env))
		  (else (eval (first-exp exps) env)
		  	    (eval-seqeuence (rest-exps exps) env))))


