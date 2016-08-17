; Predicates and Testing
#lang racket

; Require
(require rackunit)

; Predicates
(number? 1)
(string? "hello world")
(symbol? 'a)
(boolean? #t)
(list? '(a b c))
(cons? '(1 2 3))
(empty? '())

; Testing Equality
(= 1 1)
(boolean=? #t #t)
(string=? "hi" "hi")
(eq? 1 1)
(equal? 1 1)
(check-equal? (add1 1) 2)

; Membership
(define task '(one))
(define tasks '(one two three))
; > (member 'one task)
; '(one)
; > (member 'one tasks)
; '(one two three)
