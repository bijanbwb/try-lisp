; Guessing Game
; The user selects a number between 1 and 100 and the
; program makes guesses using binary search until the
; number is found.
#lang racket

; Variables
(define upper 100)
(define lower 0)
(define guess_count 1)

; Functions
(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (set! guess_count (add1 guess_count))
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (bigger)
  (set! guess_count (add1 guess_count))
  (set! lower (min upper (add1 (guess))))
  (guess))

; Start
(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))
