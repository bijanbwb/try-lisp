; SICP
; Demo code while working through SICP book.
#lang racket

; Variables
(define PI 3.14159)
(define radius 10)

(define area (* PI (* radius radius)))
(define circumference (* 2 PI radius))

; Procedural Definitions
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))


; Conditional Example
(define (abs x)
  (cond ((> x 0) x)
        ((< x 0) (- x))
        ((= x 0) 0)))

(define (tight-abs x)
  (cond ((< x 0) (- x))
        (else x)))


; Square Root
(define (square-root x)
  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                    x)))

  (sqrt-iter 1.0 x)
)